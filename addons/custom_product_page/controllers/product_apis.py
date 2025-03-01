from odoo import http
from odoo.http import request, Response
import json

class ProductAPIController(http.Controller):

    # 1️⃣ Fetch all products
    @http.route('/api/products', auth='public', methods=['GET'], type='json')
    def get_products(self, **kwargs):
        products = request.env['product.template'].sudo().search([])
        product_list = [{
            'id': product.id,
            'name': product.name,
            'price': product.list_price
        } for product in products]
        return product_list

    # 2️⃣ Fetch a single product by ID
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
