# README

La página es una plataforma de intercambio de objetos coleccionables de todo tipo.
Los CRUDs están completos y pueden hacerse desde la misma página (tanto para usuarios como para productos). En el inicio de la página
se muestran todos los productos publicados para navegar a través de ellos. Los productos con una estrella en la esquina son los productos que le pertenecen al usuario actual que está en la sesión. Si el usuario clickea uno de sus productos este será dirigido a una vista para editarlo o eliminarlo. Si el usuario clickea un producto que no le pertenece, este será dirigido a una vista con los detalles del producto y le dará una opción para hacer una solicitud de intercambio. La página ofrece al usuario la opción de publicar un producto, en donde pide los siguientes parámetros: nombre(str) descripción(str) precio (float) e indice de rareza (int del 1 al 5). También le pide al usuario adjuntar una imagen del producto.
Para utilizar la gema cloudinary sin errores y que las imágenes se muestren bien en la página es necesario poner lo siguiente en el archivo .env: CLOUDINARY_CLOUD_NAME=dwi1ya5eh
CLOUDINARY_API_KEY=761769923978181
CLOUDINARY_API_SECRET=q_w79xNUmY-YuPXfHfTsr3qCQHU
También hay que tener instalada con sudo la librería libvips.
Intentamos implementar el testing pero nos lanza errores. La implementación está en test/models/user_test.rb.


Link web: https://collector-swap-r9wz.onrender.com/