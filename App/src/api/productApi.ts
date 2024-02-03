import {baseApi} from "./api.ts";

export const productApi = baseApi.injectEndpoints({
    endpoints: builder => ({
        getProducts: builder.query<IProduct[], void>({
            query: () => ({
                url: `Products`,
                method: "GET",
            }),
        })
    })
})

export const {
    useGetProductsQuery,
} = productApi