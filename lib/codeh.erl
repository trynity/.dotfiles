%% Code path helper
%%

-module(codeh).
-compile([export_all]).


add_dist() ->
    LibDir = os:getenv("AGNER_EXACT_PREFIX"),
    {ok, Libs} = file:list_dir(LibDir),
    io:format("Libs: ~p\n", [Libs]),

    F = fun(".") ->
                ok;
           ("..") ->
                ok;
           (ModuleDir) ->
                Ebin = filename:join([LibDir, ModuleDir, "ebin"]),
                code:add_pathz(Ebin),
                io:format("Added ~p\n", [Ebin])
        end,
    [F(D) || D <- Libs]. 
