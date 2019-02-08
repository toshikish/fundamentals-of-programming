type person_t = {
    name : string;
    height : float;
    weight : float;
    birth_month : int;
    birth_day : int;
    blood_type : string;
}

let ketsueki_hyoji person = match person with 
    {name = n; height = h; weight = w; birth_month = bm; birth_day = bd; blood_type = bt} ->
        n ^ "さんの血液型は" ^ bt ^ "型です"

let test1 = ketsueki_hyoji {name = "hoge"; height = 1.7; weight = 67.0; birth_month = 4; birth_day = 25; blood_type = "A"} = "hogeさんの血液型はA型です"
