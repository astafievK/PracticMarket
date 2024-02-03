import { FC } from 'react';

interface ProductCardProps {
    productImage: string
    productTitle: string
    productManufacturerName: string
    productDescription: string
    productPrice: number
    productInStock: number
}

const ProductCard: FC<ProductCardProps> = (props) => {
    return (
        <div className="product-card">
            <img className="product-card__image" src={"/src/assets/products/"+`${props.productImage !== null ? props.productImage : "empty.png"}`} alt={props.productImage}/>
            <div className="product-card__info">
                <span className="info-title">{props.productTitle}</span>
                <span className="info-description">{props.productDescription}</span>
                <span className="info-manufacturer">Производитель: {props.productManufacturerName}</span>
                <span className="info-price">Цена: {props.productPrice}</span>
            </div>
            <div className="product-card__actions">
                <span className="in-stock">На складе: <span className="count">{props.productInStock}</span></span>
            </div>
        </div>
    );
};

export default ProductCard;