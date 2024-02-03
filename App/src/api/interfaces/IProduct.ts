interface IProduct{
    productArticleNumber: string,
    productName: string,
    productDescription: string,
    productPhoto: string,
    productPrice: number,
    productMaxDiscount: number,
    productQuantityInStock: number,
    provider: number,
    manufacturer: IManufacturer[],
    category: number,
    measureType: number,
}