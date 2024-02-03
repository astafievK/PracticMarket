import { FC } from 'react';
import SelectManufacturer from "../SelectManufacturer/SelectManufacturer.tsx";

interface HeaderCatalogProps {

}

const HeaderCatalog: FC<HeaderCatalogProps> = () => {
    return (
        <header>
            <div className="search">
                <label htmlFor="">Найдено 300 результатов</label>
                <input type="search" name="search" id="search"/>
            
                <SelectManufacturer/>
            </div>

            <div className="filter">
                <div className="filter-price">
                    <span className="title-price">Цена</span>
                    <label htmlFor="onehundred">
                        <input type="checkbox" name="onehundred" id="onehundred" />
                        <span>100-200</span>
                    </label>
                    <label htmlFor="twohundred">
                        <input type="checkbox" name="twohundred" id="twohundred" />
                        <span>200-300</span>
                    </label>
                    <label htmlFor="thirdhundred">
                        <input type="checkbox" name="thirdhundred" id="thirdhundred" />
                        <span>300 и более</span>
                    </label>
                </div>

                <div className="filter-count">
                    <span className="title-count">Количество</span>
                    <label htmlFor="countstep1">
                        <input type="checkbox" name="countstep1" id="countstep1" />
                        <span>0-5</span>
                    </label>
                    <label htmlFor="countstep2">
                        <input type="checkbox" name="countstep2" id="countstep2" />
                        <span>5-15</span>
                    </label>
                    <label htmlFor="countstep3">
                        <input type="checkbox" name="countstep3" id="countstep3" />
                        <span>15 и более</span>
                    </label>
                </div>
            </div>
        </header>
    )
};

export default HeaderCatalog;