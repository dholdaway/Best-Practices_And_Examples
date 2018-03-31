# -*- coding: utf-8 -*-
##############################################################################
#
#    OpenERP,  Open Source Management Solution,  third party addon
#    Copyright (C) 2004-2017 Vertel AB (<http://vertel.se>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation,  either version 3 of the
#    License,  or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not,  see <http://www.gnu.org/licenses/>.
#
##############################################################################
from openerp import models,  fields,  api,  _
from datetime import timedelta
from openerp import http
from openerp.http import request

import logging
_logger = logging.getLogger(__name__)

# https://www.privacy-regulation.eu
class gdpr_inventory(models.Model):
    _inherit = 'gdpr.inventory'

    website_desc = fields.Html(string="Website Description",  translation=True, track_visibility='onchange', translate=True)
    website_published = fields.Boolean(string='Website Published')


class GDPRController(http.Controller):

    @http.route(['/gdpr/main/<model("res.partner"):partner>'], type='http', auth="public", website=True)
    def gdpr_main(self, partner=None, **post):
        inventories = request.env['gdpr.inventory'].search_read(
            [
                ('partner_ids', 'in', partner.id),
                ('state_id', '=', request.env.ref('gdpr_inventory.inventory_state_active').id),
                ('website_published', '=', True)
            ],
            ['name', 'website_desc', 'state_id'])
        return request.website.render('website_gdpr.gdpr_main_page', {'inventories': inventories, 'partner': partner.name})

    @http.route(['/gdpr/inventories'], type='http', auth="public", website=True)
    def gdpr_inventories(self, partner=None, **post):
        return request.website.render('website_gdpr.gdpr_inventory_page', {
            'inventories': request.env['gdpr.inventory'].sudo().search([
                ('state_id', '=', request.env.ref('gdpr_inventory.inventory_state_active').id),
                ('website_published', '=', True)])
            })
