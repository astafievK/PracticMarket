import { FC } from 'react';
import SelectManufacturer from "../SelectManufacturer/SelectManufacturer.tsx";

interface HeaderCatalogProps {

}

const HeaderCatalog: FC<HeaderCatalogProps> = () => {
    return (
        <header>
            <SelectManufacturer/>
        </header>
    )
};

export default HeaderCatalog;