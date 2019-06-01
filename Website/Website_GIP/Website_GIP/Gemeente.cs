using System.Collections.Generic;

public class Gemeente
{
    public class Components
    {
        public string postcode { get; set; }
    }

    public class Result
    {
        public Components components { get; set; }
    }

    public class GemeenteData
    {
        public List<Result> results { get; set; }
    }
}