# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Liink.Repo.insert!(%Liink.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Liink.Repo
alias Liink.Parts.SpareParts

defmodule Seeding do
  def insert_part(attrs) do
    %SpareParts{}
    |> SpareParts.changeset(attrs)
    |> Repo.insert()
  end
end

[
  %{
    :device => "iphone 13",
    :name => "Pelicula",
    :description =>
      "2Pcs 999D Protective Tempered Glass For iPhone 13 12 mini 11 Pro Xs Max Screen Protector iPhone 7 8 Plus SE 2020 X XR Glass Film",
    :link =>
      "https://pt.aliexpress.com/item/1005004499672228.html?algo_pvid=4955b841-e4a5-4820-9e64-ab1eaa163369&aem_p4p_detail=202208141532352585944260082000065859304&algo_exp_id=4955b841-e4a5-4820-9e64-ab1eaa163369-0&pdp_ext_f=%7B%22sku_id%22%3A%2212000029378623754%22%7D&pdp_npi=2%40dis%21BRL%21%2110.18%21%21%2127.45%21%21%40210318c216605163555824571e4444%2112000029378623754%21sea&gatewayAdapt=glo2bra",
    :picture =>
      "https://ae01.alicdn.com/kf/Se352ea3b5df54f23a5d102448a6715a0J/2Pcs-999D-Protective-Tempered-Glass-For-iPhone-13-12-mini-11-Pro-Xs-Max-Screen-Protector.jpg_Q90.jpg_.webp"
  },
  %{
    :device => "Samsung A12",
    :name => "Pelicula",
    :description =>
      "4 pçs vidro temperado para samsung galaxy a52 a12 a32 a22 5g protetor de tela em samsung galaxy a72 a51 a41 a31 a70 a40 vidro claro",
    :link =>
      "https://pt.aliexpress.com/item/1005004283604648.html?algo_pvid=773f7402-82fc-44ac-be12-e063fc406efd&algo_exp_id=773f7402-82fc-44ac-be12-e063fc406efd-0&pdp_ext_f=%7B%22sku_id%22%3A%2212000028623599725%22%7D&pdp_npi=2%40dis%21BRL%2162.43%219.96%21%21%21%21%21%40210318d116605168317114517e82ac%2112000028623599725%21sea&curPageLogUid=CFGYhszZz4yp",
    :picture =>
      "https://ae01.alicdn.com/kf/S8714c15dbbda4671b6af95fe6a40595bg/4-p-s-vidro-temperado-para-samsung-galaxy-a52-a12-a32-a22-5g-protetor-de-tela.jpg_Q90.jpg_.webp"
  }
]
|> Enum.each(&Seeding.insert_part/1)
