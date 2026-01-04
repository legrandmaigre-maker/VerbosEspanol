import Foundation

struct VerbData {
    static let top30Verbs: [Verb] = [
        // 1. SER - to be (permanent)
        Verb(infinitive: "ser", meaning: "to be (permanent)", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "soy", .tu: "eres", .elElla: "es", .nosotros: "somos", .vosotros: "sois", .ellosEllas: "son"],
            .preterite: [.yo: "fui", .tu: "fuiste", .elElla: "fue", .nosotros: "fuimos", .vosotros: "fuisteis", .ellosEllas: "fueron"],
            .imperfect: [.yo: "era", .tu: "eras", .elElla: "era", .nosotros: "éramos", .vosotros: "erais", .ellosEllas: "eran"],
            .future: [.yo: "seré", .tu: "serás", .elElla: "será", .nosotros: "seremos", .vosotros: "seréis", .ellosEllas: "serán"],
            .conditional: [.yo: "sería", .tu: "serías", .elElla: "sería", .nosotros: "seríamos", .vosotros: "seríais", .ellosEllas: "serían"],
            .presentSubjunctive: [.yo: "sea", .tu: "seas", .elElla: "sea", .nosotros: "seamos", .vosotros: "seáis", .ellosEllas: "sean"],
            .imperfectSubjunctive: [.yo: "fuera", .tu: "fueras", .elElla: "fuera", .nosotros: "fuéramos", .vosotros: "fuerais", .ellosEllas: "fueran"],
            .imperative: [.tu: "sé", .elElla: "sea", .nosotros: "seamos", .vosotros: "sed", .ellosEllas: "sean"]
        ]),
        // 2. ESTAR - to be (temporary)
        Verb(infinitive: "estar", meaning: "to be (temporary/location)", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "estoy", .tu: "estás", .elElla: "está", .nosotros: "estamos", .vosotros: "estáis", .ellosEllas: "están"],
            .preterite: [.yo: "estuve", .tu: "estuviste", .elElla: "estuvo", .nosotros: "estuvimos", .vosotros: "estuvisteis", .ellosEllas: "estuvieron"],
            .imperfect: [.yo: "estaba", .tu: "estabas", .elElla: "estaba", .nosotros: "estábamos", .vosotros: "estabais", .ellosEllas: "estaban"],
            .future: [.yo: "estaré", .tu: "estarás", .elElla: "estará", .nosotros: "estaremos", .vosotros: "estaréis", .ellosEllas: "estarán"],
            .conditional: [.yo: "estaría", .tu: "estarías", .elElla: "estaría", .nosotros: "estaríamos", .vosotros: "estaríais", .ellosEllas: "estarían"],
            .presentSubjunctive: [.yo: "esté", .tu: "estés", .elElla: "esté", .nosotros: "estemos", .vosotros: "estéis", .ellosEllas: "estén"],
            .imperfectSubjunctive: [.yo: "estuviera", .tu: "estuvieras", .elElla: "estuviera", .nosotros: "estuviéramos", .vosotros: "estuvierais", .ellosEllas: "estuvieran"],
            .imperative: [.tu: "está", .elElla: "esté", .nosotros: "estemos", .vosotros: "estad", .ellosEllas: "estén"]
        ]),
        // 3. TENER - to have
        Verb(infinitive: "tener", meaning: "to have", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "tengo", .tu: "tienes", .elElla: "tiene", .nosotros: "tenemos", .vosotros: "tenéis", .ellosEllas: "tienen"],
            .preterite: [.yo: "tuve", .tu: "tuviste", .elElla: "tuvo", .nosotros: "tuvimos", .vosotros: "tuvisteis", .ellosEllas: "tuvieron"],
            .imperfect: [.yo: "tenía", .tu: "tenías", .elElla: "tenía", .nosotros: "teníamos", .vosotros: "teníais", .ellosEllas: "tenían"],
            .future: [.yo: "tendré", .tu: "tendrás", .elElla: "tendrá", .nosotros: "tendremos", .vosotros: "tendréis", .ellosEllas: "tendrán"],
            .conditional: [.yo: "tendría", .tu: "tendrías", .elElla: "tendría", .nosotros: "tendríamos", .vosotros: "tendríais", .ellosEllas: "tendrían"],
            .presentSubjunctive: [.yo: "tenga", .tu: "tengas", .elElla: "tenga", .nosotros: "tengamos", .vosotros: "tengáis", .ellosEllas: "tengan"],
            .imperfectSubjunctive: [.yo: "tuviera", .tu: "tuvieras", .elElla: "tuviera", .nosotros: "tuviéramos", .vosotros: "tuvierais", .ellosEllas: "tuvieran"],
            .imperative: [.tu: "ten", .elElla: "tenga", .nosotros: "tengamos", .vosotros: "tened", .ellosEllas: "tengan"]
        ]),
        // 4. HACER - to do/make
        Verb(infinitive: "hacer", meaning: "to do/make", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "hago", .tu: "haces", .elElla: "hace", .nosotros: "hacemos", .vosotros: "hacéis", .ellosEllas: "hacen"],
            .preterite: [.yo: "hice", .tu: "hiciste", .elElla: "hizo", .nosotros: "hicimos", .vosotros: "hicisteis", .ellosEllas: "hicieron"],
            .imperfect: [.yo: "hacía", .tu: "hacías", .elElla: "hacía", .nosotros: "hacíamos", .vosotros: "hacíais", .ellosEllas: "hacían"],
            .future: [.yo: "haré", .tu: "harás", .elElla: "hará", .nosotros: "haremos", .vosotros: "haréis", .ellosEllas: "harán"],
            .conditional: [.yo: "haría", .tu: "harías", .elElla: "haría", .nosotros: "haríamos", .vosotros: "haríais", .ellosEllas: "harían"],
            .presentSubjunctive: [.yo: "haga", .tu: "hagas", .elElla: "haga", .nosotros: "hagamos", .vosotros: "hagáis", .ellosEllas: "hagan"],
            .imperfectSubjunctive: [.yo: "hiciera", .tu: "hicieras", .elElla: "hiciera", .nosotros: "hiciéramos", .vosotros: "hicierais", .ellosEllas: "hicieran"],
            .imperative: [.tu: "haz", .elElla: "haga", .nosotros: "hagamos", .vosotros: "haced", .ellosEllas: "hagan"]
        ]),
        // 5. PODER - to be able to/can
        Verb(infinitive: "poder", meaning: "to be able to/can", irregularType: .stemChanging, conjugations: [
            .presentIndicative: [.yo: "puedo", .tu: "puedes", .elElla: "puede", .nosotros: "podemos", .vosotros: "podéis", .ellosEllas: "pueden"],
            .preterite: [.yo: "pude", .tu: "pudiste", .elElla: "pudo", .nosotros: "pudimos", .vosotros: "pudisteis", .ellosEllas: "pudieron"],
            .imperfect: [.yo: "podía", .tu: "podías", .elElla: "podía", .nosotros: "podíamos", .vosotros: "podíais", .ellosEllas: "podían"],
            .future: [.yo: "podré", .tu: "podrás", .elElla: "podrá", .nosotros: "podremos", .vosotros: "podréis", .ellosEllas: "podrán"],
            .conditional: [.yo: "podría", .tu: "podrías", .elElla: "podría", .nosotros: "podríamos", .vosotros: "podríais", .ellosEllas: "podrían"],
            .presentSubjunctive: [.yo: "pueda", .tu: "puedas", .elElla: "pueda", .nosotros: "podamos", .vosotros: "podáis", .ellosEllas: "puedan"],
            .imperfectSubjunctive: [.yo: "pudiera", .tu: "pudieras", .elElla: "pudiera", .nosotros: "pudiéramos", .vosotros: "pudierais", .ellosEllas: "pudieran"],
            .imperative: [:]
        ]),
        // 6. IR - to go
        Verb(infinitive: "ir", meaning: "to go", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "voy", .tu: "vas", .elElla: "va", .nosotros: "vamos", .vosotros: "vais", .ellosEllas: "van"],
            .preterite: [.yo: "fui", .tu: "fuiste", .elElla: "fue", .nosotros: "fuimos", .vosotros: "fuisteis", .ellosEllas: "fueron"],
            .imperfect: [.yo: "iba", .tu: "ibas", .elElla: "iba", .nosotros: "íbamos", .vosotros: "ibais", .ellosEllas: "iban"],
            .future: [.yo: "iré", .tu: "irás", .elElla: "irá", .nosotros: "iremos", .vosotros: "iréis", .ellosEllas: "irán"],
            .conditional: [.yo: "iría", .tu: "irías", .elElla: "iría", .nosotros: "iríamos", .vosotros: "iríais", .ellosEllas: "irían"],
            .presentSubjunctive: [.yo: "vaya", .tu: "vayas", .elElla: "vaya", .nosotros: "vayamos", .vosotros: "vayáis", .ellosEllas: "vayan"],
            .imperfectSubjunctive: [.yo: "fuera", .tu: "fueras", .elElla: "fuera", .nosotros: "fuéramos", .vosotros: "fuerais", .ellosEllas: "fueran"],
            .imperative: [.tu: "ve", .elElla: "vaya", .nosotros: "vamos", .vosotros: "id", .ellosEllas: "vayan"]
        ]),
        // 7. DECIR - to say/tell
        Verb(infinitive: "decir", meaning: "to say/tell", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "digo", .tu: "dices", .elElla: "dice", .nosotros: "decimos", .vosotros: "decís", .ellosEllas: "dicen"],
            .preterite: [.yo: "dije", .tu: "dijiste", .elElla: "dijo", .nosotros: "dijimos", .vosotros: "dijisteis", .ellosEllas: "dijeron"],
            .imperfect: [.yo: "decía", .tu: "decías", .elElla: "decía", .nosotros: "decíamos", .vosotros: "decíais", .ellosEllas: "decían"],
            .future: [.yo: "diré", .tu: "dirás", .elElla: "dirá", .nosotros: "diremos", .vosotros: "diréis", .ellosEllas: "dirán"],
            .conditional: [.yo: "diría", .tu: "dirías", .elElla: "diría", .nosotros: "diríamos", .vosotros: "diríais", .ellosEllas: "dirían"],
            .presentSubjunctive: [.yo: "diga", .tu: "digas", .elElla: "diga", .nosotros: "digamos", .vosotros: "digáis", .ellosEllas: "digan"],
            .imperfectSubjunctive: [.yo: "dijera", .tu: "dijeras", .elElla: "dijera", .nosotros: "dijéramos", .vosotros: "dijerais", .ellosEllas: "dijeran"],
            .imperative: [.tu: "di", .elElla: "diga", .nosotros: "digamos", .vosotros: "decid", .ellosEllas: "digan"]
        ]),
        // 8. SABER - to know (facts)
        Verb(infinitive: "saber", meaning: "to know (facts)", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "sé", .tu: "sabes", .elElla: "sabe", .nosotros: "sabemos", .vosotros: "sabéis", .ellosEllas: "saben"],
            .preterite: [.yo: "supe", .tu: "supiste", .elElla: "supo", .nosotros: "supimos", .vosotros: "supisteis", .ellosEllas: "supieron"],
            .imperfect: [.yo: "sabía", .tu: "sabías", .elElla: "sabía", .nosotros: "sabíamos", .vosotros: "sabíais", .ellosEllas: "sabían"],
            .future: [.yo: "sabré", .tu: "sabrás", .elElla: "sabrá", .nosotros: "sabremos", .vosotros: "sabréis", .ellosEllas: "sabrán"],
            .conditional: [.yo: "sabría", .tu: "sabrías", .elElla: "sabría", .nosotros: "sabríamos", .vosotros: "sabríais", .ellosEllas: "sabrían"],
            .presentSubjunctive: [.yo: "sepa", .tu: "sepas", .elElla: "sepa", .nosotros: "sepamos", .vosotros: "sepáis", .ellosEllas: "sepan"],
            .imperfectSubjunctive: [.yo: "supiera", .tu: "supieras", .elElla: "supiera", .nosotros: "supiéramos", .vosotros: "supierais", .ellosEllas: "supieran"],
            .imperative: [.tu: "sabe", .elElla: "sepa", .nosotros: "sepamos", .vosotros: "sabed", .ellosEllas: "sepan"]
        ]),
        // 9. QUERER - to want/love
        Verb(infinitive: "querer", meaning: "to want/love", irregularType: .stemChanging, conjugations: [
            .presentIndicative: [.yo: "quiero", .tu: "quieres", .elElla: "quiere", .nosotros: "queremos", .vosotros: "queréis", .ellosEllas: "quieren"],
            .preterite: [.yo: "quise", .tu: "quisiste", .elElla: "quiso", .nosotros: "quisimos", .vosotros: "quisisteis", .ellosEllas: "quisieron"],
            .imperfect: [.yo: "quería", .tu: "querías", .elElla: "quería", .nosotros: "queríamos", .vosotros: "queríais", .ellosEllas: "querían"],
            .future: [.yo: "querré", .tu: "querrás", .elElla: "querrá", .nosotros: "querremos", .vosotros: "querréis", .ellosEllas: "querrán"],
            .conditional: [.yo: "querría", .tu: "querrías", .elElla: "querría", .nosotros: "querríamos", .vosotros: "querríais", .ellosEllas: "querrían"],
            .presentSubjunctive: [.yo: "quiera", .tu: "quieras", .elElla: "quiera", .nosotros: "queramos", .vosotros: "queráis", .ellosEllas: "quieran"],
            .imperfectSubjunctive: [.yo: "quisiera", .tu: "quisieras", .elElla: "quisiera", .nosotros: "quisiéramos", .vosotros: "quisierais", .ellosEllas: "quisieran"],
            .imperative: [.tu: "quiere", .elElla: "quiera", .nosotros: "queramos", .vosotros: "quered", .ellosEllas: "quieran"]
        ]),
        // 10. VENIR - to come
        Verb(infinitive: "venir", meaning: "to come", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "vengo", .tu: "vienes", .elElla: "viene", .nosotros: "venimos", .vosotros: "venís", .ellosEllas: "vienen"],
            .preterite: [.yo: "vine", .tu: "viniste", .elElla: "vino", .nosotros: "vinimos", .vosotros: "vinisteis", .ellosEllas: "vinieron"],
            .imperfect: [.yo: "venía", .tu: "venías", .elElla: "venía", .nosotros: "veníamos", .vosotros: "veníais", .ellosEllas: "venían"],
            .future: [.yo: "vendré", .tu: "vendrás", .elElla: "vendrá", .nosotros: "vendremos", .vosotros: "vendréis", .ellosEllas: "vendrán"],
            .conditional: [.yo: "vendría", .tu: "vendrías", .elElla: "vendría", .nosotros: "vendríamos", .vosotros: "vendríais", .ellosEllas: "vendrían"],
            .presentSubjunctive: [.yo: "venga", .tu: "vengas", .elElla: "venga", .nosotros: "vengamos", .vosotros: "vengáis", .ellosEllas: "vengan"],
            .imperfectSubjunctive: [.yo: "viniera", .tu: "vinieras", .elElla: "viniera", .nosotros: "viniéramos", .vosotros: "vinierais", .ellosEllas: "vinieran"],
            .imperative: [.tu: "ven", .elElla: "venga", .nosotros: "vengamos", .vosotros: "venid", .ellosEllas: "vengan"]
        ]),
        // 11. HABLAR - to speak
        Verb(infinitive: "hablar", meaning: "to speak", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "hablo", .tu: "hablas", .elElla: "habla", .nosotros: "hablamos", .vosotros: "habláis", .ellosEllas: "hablan"],
            .preterite: [.yo: "hablé", .tu: "hablaste", .elElla: "habló", .nosotros: "hablamos", .vosotros: "hablasteis", .ellosEllas: "hablaron"],
            .imperfect: [.yo: "hablaba", .tu: "hablabas", .elElla: "hablaba", .nosotros: "hablábamos", .vosotros: "hablabais", .ellosEllas: "hablaban"],
            .future: [.yo: "hablaré", .tu: "hablarás", .elElla: "hablará", .nosotros: "hablaremos", .vosotros: "hablaréis", .ellosEllas: "hablarán"],
            .conditional: [.yo: "hablaría", .tu: "hablarías", .elElla: "hablaría", .nosotros: "hablaríamos", .vosotros: "hablaríais", .ellosEllas: "hablarían"],
            .presentSubjunctive: [.yo: "hable", .tu: "hables", .elElla: "hable", .nosotros: "hablemos", .vosotros: "habléis", .ellosEllas: "hablen"],
            .imperfectSubjunctive: [.yo: "hablara", .tu: "hablaras", .elElla: "hablara", .nosotros: "habláramos", .vosotros: "hablarais", .ellosEllas: "hablaran"],
            .imperative: [.tu: "habla", .elElla: "hable", .nosotros: "hablemos", .vosotros: "hablad", .ellosEllas: "hablen"]
        ]),
        // 12. COMER - to eat
        Verb(infinitive: "comer", meaning: "to eat", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "como", .tu: "comes", .elElla: "come", .nosotros: "comemos", .vosotros: "coméis", .ellosEllas: "comen"],
            .preterite: [.yo: "comí", .tu: "comiste", .elElla: "comió", .nosotros: "comimos", .vosotros: "comisteis", .ellosEllas: "comieron"],
            .imperfect: [.yo: "comía", .tu: "comías", .elElla: "comía", .nosotros: "comíamos", .vosotros: "comíais", .ellosEllas: "comían"],
            .future: [.yo: "comeré", .tu: "comerás", .elElla: "comerá", .nosotros: "comeremos", .vosotros: "comeréis", .ellosEllas: "comerán"],
            .conditional: [.yo: "comería", .tu: "comerías", .elElla: "comería", .nosotros: "comeríamos", .vosotros: "comeríais", .ellosEllas: "comerían"],
            .presentSubjunctive: [.yo: "coma", .tu: "comas", .elElla: "coma", .nosotros: "comamos", .vosotros: "comáis", .ellosEllas: "coman"],
            .imperfectSubjunctive: [.yo: "comiera", .tu: "comieras", .elElla: "comiera", .nosotros: "comiéramos", .vosotros: "comierais", .ellosEllas: "comieran"],
            .imperative: [.tu: "come", .elElla: "coma", .nosotros: "comamos", .vosotros: "comed", .ellosEllas: "coman"]
        ]),
        // 13. VIVIR - to live
        Verb(infinitive: "vivir", meaning: "to live", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "vivo", .tu: "vives", .elElla: "vive", .nosotros: "vivimos", .vosotros: "vivís", .ellosEllas: "viven"],
            .preterite: [.yo: "viví", .tu: "viviste", .elElla: "vivió", .nosotros: "vivimos", .vosotros: "vivisteis", .ellosEllas: "vivieron"],
            .imperfect: [.yo: "vivía", .tu: "vivías", .elElla: "vivía", .nosotros: "vivíamos", .vosotros: "vivíais", .ellosEllas: "vivían"],
            .future: [.yo: "viviré", .tu: "vivirás", .elElla: "vivirá", .nosotros: "viviremos", .vosotros: "viviréis", .ellosEllas: "vivirán"],
            .conditional: [.yo: "viviría", .tu: "vivirías", .elElla: "viviría", .nosotros: "viviríamos", .vosotros: "viviríais", .ellosEllas: "vivirían"],
            .presentSubjunctive: [.yo: "viva", .tu: "vivas", .elElla: "viva", .nosotros: "vivamos", .vosotros: "viváis", .ellosEllas: "vivan"],
            .imperfectSubjunctive: [.yo: "viviera", .tu: "vivieras", .elElla: "viviera", .nosotros: "viviéramos", .vosotros: "vivierais", .ellosEllas: "vivieran"],
            .imperative: [.tu: "vive", .elElla: "viva", .nosotros: "vivamos", .vosotros: "vivid", .ellosEllas: "vivan"]
        ]),
        // 14. DAR - to give
        Verb(infinitive: "dar", meaning: "to give", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "doy", .tu: "das", .elElla: "da", .nosotros: "damos", .vosotros: "dais", .ellosEllas: "dan"],
            .preterite: [.yo: "di", .tu: "diste", .elElla: "dio", .nosotros: "dimos", .vosotros: "disteis", .ellosEllas: "dieron"],
            .imperfect: [.yo: "daba", .tu: "dabas", .elElla: "daba", .nosotros: "dábamos", .vosotros: "dabais", .ellosEllas: "daban"],
            .future: [.yo: "daré", .tu: "darás", .elElla: "dará", .nosotros: "daremos", .vosotros: "daréis", .ellosEllas: "darán"],
            .conditional: [.yo: "daría", .tu: "darías", .elElla: "daría", .nosotros: "daríamos", .vosotros: "daríais", .ellosEllas: "darían"],
            .presentSubjunctive: [.yo: "dé", .tu: "des", .elElla: "dé", .nosotros: "demos", .vosotros: "deis", .ellosEllas: "den"],
            .imperfectSubjunctive: [.yo: "diera", .tu: "dieras", .elElla: "diera", .nosotros: "diéramos", .vosotros: "dierais", .ellosEllas: "dieran"],
            .imperative: [.tu: "da", .elElla: "dé", .nosotros: "demos", .vosotros: "dad", .ellosEllas: "den"]
        ]),
        // 15. VER - to see
        Verb(infinitive: "ver", meaning: "to see", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "veo", .tu: "ves", .elElla: "ve", .nosotros: "vemos", .vosotros: "veis", .ellosEllas: "ven"],
            .preterite: [.yo: "vi", .tu: "viste", .elElla: "vio", .nosotros: "vimos", .vosotros: "visteis", .ellosEllas: "vieron"],
            .imperfect: [.yo: "veía", .tu: "veías", .elElla: "veía", .nosotros: "veíamos", .vosotros: "veíais", .ellosEllas: "veían"],
            .future: [.yo: "veré", .tu: "verás", .elElla: "verá", .nosotros: "veremos", .vosotros: "veréis", .ellosEllas: "verán"],
            .conditional: [.yo: "vería", .tu: "verías", .elElla: "vería", .nosotros: "veríamos", .vosotros: "veríais", .ellosEllas: "verían"],
            .presentSubjunctive: [.yo: "vea", .tu: "veas", .elElla: "vea", .nosotros: "veamos", .vosotros: "veáis", .ellosEllas: "vean"],
            .imperfectSubjunctive: [.yo: "viera", .tu: "vieras", .elElla: "viera", .nosotros: "viéramos", .vosotros: "vierais", .ellosEllas: "vieran"],
            .imperative: [.tu: "ve", .elElla: "vea", .nosotros: "veamos", .vosotros: "ved", .ellosEllas: "vean"]
        ]),
        // 16. PONER - to put
        Verb(infinitive: "poner", meaning: "to put", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "pongo", .tu: "pones", .elElla: "pone", .nosotros: "ponemos", .vosotros: "ponéis", .ellosEllas: "ponen"],
            .preterite: [.yo: "puse", .tu: "pusiste", .elElla: "puso", .nosotros: "pusimos", .vosotros: "pusisteis", .ellosEllas: "pusieron"],
            .imperfect: [.yo: "ponía", .tu: "ponías", .elElla: "ponía", .nosotros: "poníamos", .vosotros: "poníais", .ellosEllas: "ponían"],
            .future: [.yo: "pondré", .tu: "pondrás", .elElla: "pondrá", .nosotros: "pondremos", .vosotros: "pondréis", .ellosEllas: "pondrán"],
            .conditional: [.yo: "pondría", .tu: "pondrías", .elElla: "pondría", .nosotros: "pondríamos", .vosotros: "pondríais", .ellosEllas: "pondrían"],
            .presentSubjunctive: [.yo: "ponga", .tu: "pongas", .elElla: "ponga", .nosotros: "pongamos", .vosotros: "pongáis", .ellosEllas: "pongan"],
            .imperfectSubjunctive: [.yo: "pusiera", .tu: "pusieras", .elElla: "pusiera", .nosotros: "pusiéramos", .vosotros: "pusierais", .ellosEllas: "pusieran"],
            .imperative: [.tu: "pon", .elElla: "ponga", .nosotros: "pongamos", .vosotros: "poned", .ellosEllas: "pongan"]
        ]),
        // 17. SALIR - to leave/go out
        Verb(infinitive: "salir", meaning: "to leave/go out", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "salgo", .tu: "sales", .elElla: "sale", .nosotros: "salimos", .vosotros: "salís", .ellosEllas: "salen"],
            .preterite: [.yo: "salí", .tu: "saliste", .elElla: "salió", .nosotros: "salimos", .vosotros: "salisteis", .ellosEllas: "salieron"],
            .imperfect: [.yo: "salía", .tu: "salías", .elElla: "salía", .nosotros: "salíamos", .vosotros: "salíais", .ellosEllas: "salían"],
            .future: [.yo: "saldré", .tu: "saldrás", .elElla: "saldrá", .nosotros: "saldremos", .vosotros: "saldréis", .ellosEllas: "saldrán"],
            .conditional: [.yo: "saldría", .tu: "saldrías", .elElla: "saldría", .nosotros: "saldríamos", .vosotros: "saldríais", .ellosEllas: "saldrían"],
            .presentSubjunctive: [.yo: "salga", .tu: "salgas", .elElla: "salga", .nosotros: "salgamos", .vosotros: "salgáis", .ellosEllas: "salgan"],
            .imperfectSubjunctive: [.yo: "saliera", .tu: "salieras", .elElla: "saliera", .nosotros: "saliéramos", .vosotros: "salierais", .ellosEllas: "salieran"],
            .imperative: [.tu: "sal", .elElla: "salga", .nosotros: "salgamos", .vosotros: "salid", .ellosEllas: "salgan"]
        ]),
        // 18. LLEGAR - to arrive
        Verb(infinitive: "llegar", meaning: "to arrive", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "llego", .tu: "llegas", .elElla: "llega", .nosotros: "llegamos", .vosotros: "llegáis", .ellosEllas: "llegan"],
            .preterite: [.yo: "llegué", .tu: "llegaste", .elElla: "llegó", .nosotros: "llegamos", .vosotros: "llegasteis", .ellosEllas: "llegaron"],
            .imperfect: [.yo: "llegaba", .tu: "llegabas", .elElla: "llegaba", .nosotros: "llegábamos", .vosotros: "llegabais", .ellosEllas: "llegaban"],
            .future: [.yo: "llegaré", .tu: "llegarás", .elElla: "llegará", .nosotros: "llegaremos", .vosotros: "llegaréis", .ellosEllas: "llegarán"],
            .conditional: [.yo: "llegaría", .tu: "llegarías", .elElla: "llegaría", .nosotros: "llegaríamos", .vosotros: "llegaríais", .ellosEllas: "llegarían"],
            .presentSubjunctive: [.yo: "llegue", .tu: "llegues", .elElla: "llegue", .nosotros: "lleguemos", .vosotros: "lleguéis", .ellosEllas: "lleguen"],
            .imperfectSubjunctive: [.yo: "llegara", .tu: "llegaras", .elElla: "llegara", .nosotros: "llegáramos", .vosotros: "llegarais", .ellosEllas: "llegaran"],
            .imperative: [.tu: "llega", .elElla: "llegue", .nosotros: "lleguemos", .vosotros: "llegad", .ellosEllas: "lleguen"]
        ]),
        // 19. PENSAR - to think
        Verb(infinitive: "pensar", meaning: "to think", irregularType: .stemChanging, conjugations: [
            .presentIndicative: [.yo: "pienso", .tu: "piensas", .elElla: "piensa", .nosotros: "pensamos", .vosotros: "pensáis", .ellosEllas: "piensan"],
            .preterite: [.yo: "pensé", .tu: "pensaste", .elElla: "pensó", .nosotros: "pensamos", .vosotros: "pensasteis", .ellosEllas: "pensaron"],
            .imperfect: [.yo: "pensaba", .tu: "pensabas", .elElla: "pensaba", .nosotros: "pensábamos", .vosotros: "pensabais", .ellosEllas: "pensaban"],
            .future: [.yo: "pensaré", .tu: "pensarás", .elElla: "pensará", .nosotros: "pensaremos", .vosotros: "pensaréis", .ellosEllas: "pensarán"],
            .conditional: [.yo: "pensaría", .tu: "pensarías", .elElla: "pensaría", .nosotros: "pensaríamos", .vosotros: "pensaríais", .ellosEllas: "pensarían"],
            .presentSubjunctive: [.yo: "piense", .tu: "pienses", .elElla: "piense", .nosotros: "pensemos", .vosotros: "penséis", .ellosEllas: "piensen"],
            .imperfectSubjunctive: [.yo: "pensara", .tu: "pensaras", .elElla: "pensara", .nosotros: "pensáramos", .vosotros: "pensarais", .ellosEllas: "pensaran"],
            .imperative: [.tu: "piensa", .elElla: "piense", .nosotros: "pensemos", .vosotros: "pensad", .ellosEllas: "piensen"]
        ]),
        // 20. DORMIR - to sleep
        Verb(infinitive: "dormir", meaning: "to sleep", irregularType: .stemChanging, conjugations: [
            .presentIndicative: [.yo: "duermo", .tu: "duermes", .elElla: "duerme", .nosotros: "dormimos", .vosotros: "dormís", .ellosEllas: "duermen"],
            .preterite: [.yo: "dormí", .tu: "dormiste", .elElla: "durmió", .nosotros: "dormimos", .vosotros: "dormisteis", .ellosEllas: "durmieron"],
            .imperfect: [.yo: "dormía", .tu: "dormías", .elElla: "dormía", .nosotros: "dormíamos", .vosotros: "dormíais", .ellosEllas: "dormían"],
            .future: [.yo: "dormiré", .tu: "dormirás", .elElla: "dormirá", .nosotros: "dormiremos", .vosotros: "dormiréis", .ellosEllas: "dormirán"],
            .conditional: [.yo: "dormiría", .tu: "dormirías", .elElla: "dormiría", .nosotros: "dormiríamos", .vosotros: "dormiríais", .ellosEllas: "dormirían"],
            .presentSubjunctive: [.yo: "duerma", .tu: "duermas", .elElla: "duerma", .nosotros: "durmamos", .vosotros: "durmáis", .ellosEllas: "duerman"],
            .imperfectSubjunctive: [.yo: "durmiera", .tu: "durmieras", .elElla: "durmiera", .nosotros: "durmiéramos", .vosotros: "durmierais", .ellosEllas: "durmieran"],
            .imperative: [.tu: "duerme", .elElla: "duerma", .nosotros: "durmamos", .vosotros: "dormid", .ellosEllas: "duerman"]
        ]),
        // 21. ESCRIBIR - to write
        Verb(infinitive: "escribir", meaning: "to write", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "escribo", .tu: "escribes", .elElla: "escribe", .nosotros: "escribimos", .vosotros: "escribís", .ellosEllas: "escriben"],
            .preterite: [.yo: "escribí", .tu: "escribiste", .elElla: "escribió", .nosotros: "escribimos", .vosotros: "escribisteis", .ellosEllas: "escribieron"],
            .imperfect: [.yo: "escribía", .tu: "escribías", .elElla: "escribía", .nosotros: "escribíamos", .vosotros: "escribíais", .ellosEllas: "escribían"],
            .future: [.yo: "escribiré", .tu: "escribirás", .elElla: "escribirá", .nosotros: "escribiremos", .vosotros: "escribiréis", .ellosEllas: "escribirán"],
            .conditional: [.yo: "escribiría", .tu: "escribirías", .elElla: "escribiría", .nosotros: "escribiríamos", .vosotros: "escribiríais", .ellosEllas: "escribirían"],
            .presentSubjunctive: [.yo: "escriba", .tu: "escribas", .elElla: "escriba", .nosotros: "escribamos", .vosotros: "escribáis", .ellosEllas: "escriban"],
            .imperfectSubjunctive: [.yo: "escribiera", .tu: "escribieras", .elElla: "escribiera", .nosotros: "escribiéramos", .vosotros: "escribierais", .ellosEllas: "escribieran"],
            .imperative: [.tu: "escribe", .elElla: "escriba", .nosotros: "escribamos", .vosotros: "escribid", .ellosEllas: "escriban"]
        ]),
        // 22. LEER - to read
        Verb(infinitive: "leer", meaning: "to read", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "leo", .tu: "lees", .elElla: "lee", .nosotros: "leemos", .vosotros: "leéis", .ellosEllas: "leen"],
            .preterite: [.yo: "leí", .tu: "leíste", .elElla: "leyó", .nosotros: "leímos", .vosotros: "leísteis", .ellosEllas: "leyeron"],
            .imperfect: [.yo: "leía", .tu: "leías", .elElla: "leía", .nosotros: "leíamos", .vosotros: "leíais", .ellosEllas: "leían"],
            .future: [.yo: "leeré", .tu: "leerás", .elElla: "leerá", .nosotros: "leeremos", .vosotros: "leeréis", .ellosEllas: "leerán"],
            .conditional: [.yo: "leería", .tu: "leerías", .elElla: "leería", .nosotros: "leeríamos", .vosotros: "leeríais", .ellosEllas: "leerían"],
            .presentSubjunctive: [.yo: "lea", .tu: "leas", .elElla: "lea", .nosotros: "leamos", .vosotros: "leáis", .ellosEllas: "lean"],
            .imperfectSubjunctive: [.yo: "leyera", .tu: "leyeras", .elElla: "leyera", .nosotros: "leyéramos", .vosotros: "leyerais", .ellosEllas: "leyeran"],
            .imperative: [.tu: "lee", .elElla: "lea", .nosotros: "leamos", .vosotros: "leed", .ellosEllas: "lean"]
        ]),
        // 23. TRABAJAR - to work
        Verb(infinitive: "trabajar", meaning: "to work", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "trabajo", .tu: "trabajas", .elElla: "trabaja", .nosotros: "trabajamos", .vosotros: "trabajáis", .ellosEllas: "trabajan"],
            .preterite: [.yo: "trabajé", .tu: "trabajaste", .elElla: "trabajó", .nosotros: "trabajamos", .vosotros: "trabajasteis", .ellosEllas: "trabajaron"],
            .imperfect: [.yo: "trabajaba", .tu: "trabajabas", .elElla: "trabajaba", .nosotros: "trabajábamos", .vosotros: "trabajabais", .ellosEllas: "trabajaban"],
            .future: [.yo: "trabajaré", .tu: "trabajarás", .elElla: "trabajará", .nosotros: "trabajaremos", .vosotros: "trabajaréis", .ellosEllas: "trabajarán"],
            .conditional: [.yo: "trabajaría", .tu: "trabajarías", .elElla: "trabajaría", .nosotros: "trabajaríamos", .vosotros: "trabajaríais", .ellosEllas: "trabajarían"],
            .presentSubjunctive: [.yo: "trabaje", .tu: "trabajes", .elElla: "trabaje", .nosotros: "trabajemos", .vosotros: "trabajéis", .ellosEllas: "trabajen"],
            .imperfectSubjunctive: [.yo: "trabajara", .tu: "trabajaras", .elElla: "trabajara", .nosotros: "trabajáramos", .vosotros: "trabajarais", .ellosEllas: "trabajaran"],
            .imperative: [.tu: "trabaja", .elElla: "trabaje", .nosotros: "trabajemos", .vosotros: "trabajad", .ellosEllas: "trabajen"]
        ]),
        // 24. CONOCER - to know (people/places)
        Verb(infinitive: "conocer", meaning: "to know (people)", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "conozco", .tu: "conoces", .elElla: "conoce", .nosotros: "conocemos", .vosotros: "conocéis", .ellosEllas: "conocen"],
            .preterite: [.yo: "conocí", .tu: "conociste", .elElla: "conoció", .nosotros: "conocimos", .vosotros: "conocisteis", .ellosEllas: "conocieron"],
            .imperfect: [.yo: "conocía", .tu: "conocías", .elElla: "conocía", .nosotros: "conocíamos", .vosotros: "conocíais", .ellosEllas: "conocían"],
            .future: [.yo: "conoceré", .tu: "conocerás", .elElla: "conocerá", .nosotros: "conoceremos", .vosotros: "conoceréis", .ellosEllas: "conocerán"],
            .conditional: [.yo: "conocería", .tu: "conocerías", .elElla: "conocería", .nosotros: "conoceríamos", .vosotros: "conoceríais", .ellosEllas: "conocerían"],
            .presentSubjunctive: [.yo: "conozca", .tu: "conozcas", .elElla: "conozca", .nosotros: "conozcamos", .vosotros: "conozcáis", .ellosEllas: "conozcan"],
            .imperfectSubjunctive: [.yo: "conociera", .tu: "conocieras", .elElla: "conociera", .nosotros: "conociéramos", .vosotros: "conocierais", .ellosEllas: "conocieran"],
            .imperative: [.tu: "conoce", .elElla: "conozca", .nosotros: "conozcamos", .vosotros: "conoced", .ellosEllas: "conozcan"]
        ]),
        // 25. SEGUIR - to follow/continue
        Verb(infinitive: "seguir", meaning: "to follow", irregularType: .stemChanging, conjugations: [
            .presentIndicative: [.yo: "sigo", .tu: "sigues", .elElla: "sigue", .nosotros: "seguimos", .vosotros: "seguís", .ellosEllas: "siguen"],
            .preterite: [.yo: "seguí", .tu: "seguiste", .elElla: "siguió", .nosotros: "seguimos", .vosotros: "seguisteis", .ellosEllas: "siguieron"],
            .imperfect: [.yo: "seguía", .tu: "seguías", .elElla: "seguía", .nosotros: "seguíamos", .vosotros: "seguíais", .ellosEllas: "seguían"],
            .future: [.yo: "seguiré", .tu: "seguirás", .elElla: "seguirá", .nosotros: "seguiremos", .vosotros: "seguiréis", .ellosEllas: "seguirán"],
            .conditional: [.yo: "seguiría", .tu: "seguirías", .elElla: "seguiría", .nosotros: "seguiríamos", .vosotros: "seguiríais", .ellosEllas: "seguirían"],
            .presentSubjunctive: [.yo: "siga", .tu: "sigas", .elElla: "siga", .nosotros: "sigamos", .vosotros: "sigáis", .ellosEllas: "sigan"],
            .imperfectSubjunctive: [.yo: "siguiera", .tu: "siguieras", .elElla: "siguiera", .nosotros: "siguiéramos", .vosotros: "siguierais", .ellosEllas: "siguieran"],
            .imperative: [.tu: "sigue", .elElla: "siga", .nosotros: "sigamos", .vosotros: "seguid", .ellosEllas: "sigan"]
        ]),
        // 26. ENCONTRAR - to find
        Verb(infinitive: "encontrar", meaning: "to find", irregularType: .stemChanging, conjugations: [
            .presentIndicative: [.yo: "encuentro", .tu: "encuentras", .elElla: "encuentra", .nosotros: "encontramos", .vosotros: "encontráis", .ellosEllas: "encuentran"],
            .preterite: [.yo: "encontré", .tu: "encontraste", .elElla: "encontró", .nosotros: "encontramos", .vosotros: "encontrasteis", .ellosEllas: "encontraron"],
            .imperfect: [.yo: "encontraba", .tu: "encontrabas", .elElla: "encontraba", .nosotros: "encontrábamos", .vosotros: "encontrabais", .ellosEllas: "encontraban"],
            .future: [.yo: "encontraré", .tu: "encontrarás", .elElla: "encontrará", .nosotros: "encontraremos", .vosotros: "encontraréis", .ellosEllas: "encontrarán"],
            .conditional: [.yo: "encontraría", .tu: "encontrarías", .elElla: "encontraría", .nosotros: "encontraríamos", .vosotros: "encontraríais", .ellosEllas: "encontrarían"],
            .presentSubjunctive: [.yo: "encuentre", .tu: "encuentres", .elElla: "encuentre", .nosotros: "encontremos", .vosotros: "encontréis", .ellosEllas: "encuentren"],
            .imperfectSubjunctive: [.yo: "encontrara", .tu: "encontraras", .elElla: "encontrara", .nosotros: "encontráramos", .vosotros: "encontrarais", .ellosEllas: "encontraran"],
            .imperative: [.tu: "encuentra", .elElla: "encuentre", .nosotros: "encontremos", .vosotros: "encontrad", .ellosEllas: "encuentren"]
        ]),
        // 27. CREER - to believe
        Verb(infinitive: "creer", meaning: "to believe", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "creo", .tu: "crees", .elElla: "cree", .nosotros: "creemos", .vosotros: "creéis", .ellosEllas: "creen"],
            .preterite: [.yo: "creí", .tu: "creíste", .elElla: "creyó", .nosotros: "creímos", .vosotros: "creísteis", .ellosEllas: "creyeron"],
            .imperfect: [.yo: "creía", .tu: "creías", .elElla: "creía", .nosotros: "creíamos", .vosotros: "creíais", .ellosEllas: "creían"],
            .future: [.yo: "creeré", .tu: "creerás", .elElla: "creerá", .nosotros: "creeremos", .vosotros: "creeréis", .ellosEllas: "creerán"],
            .conditional: [.yo: "creería", .tu: "creerías", .elElla: "creería", .nosotros: "creeríamos", .vosotros: "creeríais", .ellosEllas: "creerían"],
            .presentSubjunctive: [.yo: "crea", .tu: "creas", .elElla: "crea", .nosotros: "creamos", .vosotros: "creáis", .ellosEllas: "crean"],
            .imperfectSubjunctive: [.yo: "creyera", .tu: "creyeras", .elElla: "creyera", .nosotros: "creyéramos", .vosotros: "creyerais", .ellosEllas: "creyeran"],
            .imperative: [.tu: "cree", .elElla: "crea", .nosotros: "creamos", .vosotros: "creed", .ellosEllas: "crean"]
        ]),
        // 28. LLAMAR - to call
        Verb(infinitive: "llamar", meaning: "to call", irregularType: .regular, conjugations: [
            .presentIndicative: [.yo: "llamo", .tu: "llamas", .elElla: "llama", .nosotros: "llamamos", .vosotros: "llamáis", .ellosEllas: "llaman"],
            .preterite: [.yo: "llamé", .tu: "llamaste", .elElla: "llamó", .nosotros: "llamamos", .vosotros: "llamasteis", .ellosEllas: "llamaron"],
            .imperfect: [.yo: "llamaba", .tu: "llamabas", .elElla: "llamaba", .nosotros: "llamábamos", .vosotros: "llamabais", .ellosEllas: "llamaban"],
            .future: [.yo: "llamaré", .tu: "llamarás", .elElla: "llamará", .nosotros: "llamaremos", .vosotros: "llamaréis", .ellosEllas: "llamarán"],
            .conditional: [.yo: "llamaría", .tu: "llamarías", .elElla: "llamaría", .nosotros: "llamaríamos", .vosotros: "llamaríais", .ellosEllas: "llamarían"],
            .presentSubjunctive: [.yo: "llame", .tu: "llames", .elElla: "llame", .nosotros: "llamemos", .vosotros: "llaméis", .ellosEllas: "llamen"],
            .imperfectSubjunctive: [.yo: "llamara", .tu: "llamaras", .elElla: "llamara", .nosotros: "llamáramos", .vosotros: "llamarais", .ellosEllas: "llamaran"],
            .imperative: [.tu: "llama", .elElla: "llame", .nosotros: "llamemos", .vosotros: "llamad", .ellosEllas: "llamen"]
        ]),
        // 29. SENTIR - to feel
        Verb(infinitive: "sentir", meaning: "to feel", irregularType: .stemChanging, conjugations: [
            .presentIndicative: [.yo: "siento", .tu: "sientes", .elElla: "siente", .nosotros: "sentimos", .vosotros: "sentís", .ellosEllas: "sienten"],
            .preterite: [.yo: "sentí", .tu: "sentiste", .elElla: "sintió", .nosotros: "sentimos", .vosotros: "sentisteis", .ellosEllas: "sintieron"],
            .imperfect: [.yo: "sentía", .tu: "sentías", .elElla: "sentía", .nosotros: "sentíamos", .vosotros: "sentíais", .ellosEllas: "sentían"],
            .future: [.yo: "sentiré", .tu: "sentirás", .elElla: "sentirá", .nosotros: "sentiremos", .vosotros: "sentiréis", .ellosEllas: "sentirán"],
            .conditional: [.yo: "sentiría", .tu: "sentirías", .elElla: "sentiría", .nosotros: "sentiríamos", .vosotros: "sentiríais", .ellosEllas: "sentirían"],
            .presentSubjunctive: [.yo: "sienta", .tu: "sientas", .elElla: "sienta", .nosotros: "sintamos", .vosotros: "sintáis", .ellosEllas: "sientan"],
            .imperfectSubjunctive: [.yo: "sintiera", .tu: "sintieras", .elElla: "sintiera", .nosotros: "sintiéramos", .vosotros: "sintierais", .ellosEllas: "sintieran"],
            .imperative: [.tu: "siente", .elElla: "sienta", .nosotros: "sintamos", .vosotros: "sentid", .ellosEllas: "sientan"]
        ]),
        // 30. OÍR - to hear
        Verb(infinitive: "oír", meaning: "to hear", irregularType: .irregular, conjugations: [
            .presentIndicative: [.yo: "oigo", .tu: "oyes", .elElla: "oye", .nosotros: "oímos", .vosotros: "oís", .ellosEllas: "oyen"],
            .preterite: [.yo: "oí", .tu: "oíste", .elElla: "oyó", .nosotros: "oímos", .vosotros: "oísteis", .ellosEllas: "oyeron"],
            .imperfect: [.yo: "oía", .tu: "oías", .elElla: "oía", .nosotros: "oíamos", .vosotros: "oíais", .ellosEllas: "oían"],
            .future: [.yo: "oiré", .tu: "oirás", .elElla: "oirá", .nosotros: "oiremos", .vosotros: "oiréis", .ellosEllas: "oirán"],
            .conditional: [.yo: "oiría", .tu: "oirías", .elElla: "oiría", .nosotros: "oiríamos", .vosotros: "oiríais", .ellosEllas: "oirían"],
            .presentSubjunctive: [.yo: "oiga", .tu: "oigas", .elElla: "oiga", .nosotros: "oigamos", .vosotros: "oigáis", .ellosEllas: "oigan"],
            .imperfectSubjunctive: [.yo: "oyera", .tu: "oyeras", .elElla: "oyera", .nosotros: "oyéramos", .vosotros: "oyerais", .ellosEllas: "oyeran"],
            .imperative: [.tu: "oye", .elElla: "oiga", .nosotros: "oigamos", .vosotros: "oíd", .ellosEllas: "oigan"]
        ])
    ]
}
