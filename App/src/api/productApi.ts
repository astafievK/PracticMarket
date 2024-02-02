import {api} from "./api.ts";

export const productApi = api.injectEndpoints({
    endpoints: builder => ({
        getProducts: builder.query<Product[], void>({
            query: () => ({
                url: `Products`,
                method: "GET",
            }),
        }),
    })
})

export const {
    useGetProductsQuery,
} = productApi