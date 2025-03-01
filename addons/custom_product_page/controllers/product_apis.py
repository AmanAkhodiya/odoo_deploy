from odoo import http
from odoo.http import request, Response
import json

class ProductAPIController(http.Controller):

    @http.route('/api/products', type='http', auth='public', methods=['GET'])
    def get_products(self):
        products = request.env['product.template'].sudo().search([])
        result = [{'id': prod.id, 'name': prod.name, 'price': prod.list_price} for prod in products]

        return Response(json.dumps(result), content_type="application/json", status=200)

    @http.route('/api/product/<int:product_id>', type='http', auth='public', methods=['GET'])
    def get_product(self, product_id):
        product = request.env['product.template'].sudo().browse(product_id)
        if not product.exists():
            return Response(json.dumps({'error': 'Product not found'}), content_type="application/json", status=404)

        result = {'id': product.id, 'name': product.name, 'price': product.list_price}
        return Response(json.dumps(result), content_type="application/json", status=200)
