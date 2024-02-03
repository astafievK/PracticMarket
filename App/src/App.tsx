import PageCatalog from "./components/PageCatalog/PageCatalog.tsx";
import './index.css'
import { Outlet, Route, RouterProvider, createBrowserRouter, createRoutesFromElements } from 'react-router-dom';
import { Provider } from 'react-redux';
import {persistor, store} from "./store/store.ts";
import {PersistGate} from "redux-persist/integration/react";

const Root = () => {
  return (
      <>
          <Outlet/>
      </>
  )
}

const router = createBrowserRouter(
  createRoutesFromElements(
      <Route path="/" element={<Root />}>
          <Route path="" element={
              <>
                  <PageCatalog/>
              </>
          } />
      </Route>
  ))

function App() {
  return (
    <Provider store={store}>
        <PersistGate loading={null} persistor={persistor}>
            <RouterProvider router={router} />
        </PersistGate>
    </Provider>
)
}

export default App
