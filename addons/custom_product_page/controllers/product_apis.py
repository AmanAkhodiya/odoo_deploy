from odoo import http
from odoo.http import request, Response
import json

class ProductAPIController(http.Controller):

    # def _authenticate(self):
    #     """Check if the request contains a valid API token."""
    #     token = request.httprequest.headers.get('Authorization')
    #     if not token:
    #         return {'error': 'Missing API Token'}
        
    #     # Validate token against Odoo users
    #     user = request.env['res.users'].sudo().search([('api_token', '=', token)])
    #     if not user:
    #         return {'error': 'Invalid API Token'}

    #     return user

    @http.route('/api/products', auth='none', methods=['GET'], type='json')
    def get_products(self, **kwargs):
        # user = self._authenticate()
        # if isinstance(user, dict):  # Authentication failed
        #     return user

        products = request.env['product.template'].sudo().search([])
        product_list = [{
            'id': product.id,
            'name': product.name,
            'price': product.list_price
        } for product in products]
        return product_list
    
        @http.route('/api/product/<int:product_id>', auth='public', methods=['GET'], type='json')
        def get_product(self, product_id, **kwargs):
            product = request.env['product.template'].sudo().browse(product_id)
            if not product.exists():
                return {'error': 'Product not found'}
            return {
                'id': product.id,
                'name': product.name,
                'price': product.list_price
            }