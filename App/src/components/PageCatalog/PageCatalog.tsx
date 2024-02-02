import { FC } from 'react';
import ProductCard from "../ProductCard/ProductCard.tsx";
import HeaderCatalog from "../HeaderCatalog/HeaderCatalog.tsx";
import {useGetProductsQuery} from "../../api/productApi.ts";

interface PageCatalogProps {

}

const PageCatalog: FC<PageCatalogProps> = () => {
    const {data} = useGetProductsQuery()

    return (
        <>
            <HeaderCatalog/>
            <div className="catalog">
                {
                    data?.map((product) => (
                        <ProductCard
                            productImage={product.productPhoto}
                            productTitle={product.productName}
                            productManufacturerName={String(product.manufacturerId)}
                            productDescription={product.productDescription}
                            productPrice={product.productPrice}
                            productInStock={product.productQuantityInStock}
                        />
                    ))
                }
            </div>
        </>
    );
};

export default PageCatalog;