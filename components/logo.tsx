export function Logo() {
  return (
    <svg
      viewBox="0 0 576 171"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className="w-full h-full"
    >
      {/* Text "La Nota" */}
      <text x="130" y="105" fontSize="72" fontWeight="bold" fontFamily="Arial, sans-serif" fill="#000">
        La Nota
      </text>

      {/* Text "Digital" */}
      <text x="165" y="150" fontSize="56" fontWeight="300" fontFamily="Arial, sans-serif" fill="#333">
        Digital
      </text>

      {/* Text ".co" */}
      <text x="275" y="150" fontSize="48" fontWeight="bold" fontFamily="Arial, sans-serif" fill="#000">
        .co
      </text>

      {/* Orange quotation mark (curved) */}
      <g transform="translate(310, 70)">
        <path
          d="M 0 0 Q 20 0 20 20 Q 20 40 0 40 M 30 0 Q 50 0 50 20 Q 50 40 30 40"
          stroke="#FF6B35"
          strokeWidth="8"
          fill="none"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
      </g>

      {/* Black quotation mark (curved) */}
      <g transform="translate(345, 70)">
        <path
          d="M 0 0 Q 20 0 20 20 Q 20 40 0 40 M 30 0 Q 50 0 50 20 Q 50 40 30 40"
          stroke="#000"
          strokeWidth="8"
          fill="none"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
      </g>
    </svg>
  )
}
