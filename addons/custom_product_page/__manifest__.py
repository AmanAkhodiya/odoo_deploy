{
    'name': 'Custom Product Page',
    'summary': 'Overrides the Odoo eCommerce product page',
    'version': '1.0',
    'depends': ['website_sale'],
    'author': 'Aman Akhodiya',
    'data': [
        'views/product_page.xml',
    ],
    'assets': {
        'web.assets_frontend': [
            'custom_product_page/static/src/css/custom_style.css',
        ]
    },
    'license': 'LGPL-3',
    'installable': True,
    'application': True,
}
