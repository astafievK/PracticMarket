import { FC } from 'react';

interface SelectManufacturerProps {

}

const SelectManufacturer: FC<SelectManufacturerProps> = () => {
    return (
        <select>
            <option value="Knauf">Все производители</option>
            <option value="Knauf">Knauf</option>
        </select>
    )
};

export default SelectManufacturer;