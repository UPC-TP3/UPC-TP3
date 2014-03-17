
namespace CI.SIC.BE
{
    public class EvaluacionDetalleBE
    {
        public int IdEvaluacionDetalle { get; set; }
        public int IdEvaluacion { get; set; }
        public int IdVerificacion { get; set; }
        public bool Conformidad { get; set; }

        public string Item { get; set; }
    }
}
