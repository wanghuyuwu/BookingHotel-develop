const checkInInput = document.querySelector('input[name="check_in_date"]');
const checkOutInput = document.querySelector('input[name="check_out_date"]');
const numGuestsInput = document.querySelector('input[name="num_guests"]');
const totalCostInput = document.querySelector('input[name="total_cost"]');
const errorMessage = document.querySelector("#error-message");

checkInInput.addEventListener("input", calculateTotalCost);
checkOutInput.addEventListener("input", calculateTotalCost);
numGuestsInput.addEventListener("input", calculateTotalCost);

function calculateTotalCost() {
    const checkInDate = new Date(checkInInput.value);
    const checkOutDate = new Date(checkOutInput.value);

    if (checkInDate >= checkOutDate) {
        errorMessage.textContent = "Ngày nhận phòng phải trước ngày trả phòng";
        totalCostInput.value = "";
    } else {
        errorMessage.textContent = "";

        const days = (checkOutDate - checkInDate) / (1000 * 60 * 60 * 24);
        const numGuests = parseInt(numGuestsInput.value);

        if (numGuests > numGuestsLimit) {
            errorMessage.textContent = "Số lượng khách vượt quá giới hạn";
            totalCostInput.value = "";
        } else {
            errorMessage.textContent = "";
            totalCostInput.value = (pricePerNight * days).toFixed(0);
        }

    }
}
