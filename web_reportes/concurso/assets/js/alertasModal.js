
    var confirmText = $('#confirm-text');
    var confirmColor = $('#confirm-color');
    //--------------- Basic Examples ---------------

    //--------------- Position ---------------
  
   
  
    //--------------- Animations ---------------
  
  
    //--------------- Types ---------------
  
    // Success
  
  function alertaExisto(mensaje){
      Swal.fire({
          title: 'Good job!',
          text: mensaje,
          icon: 'success',
          customClass: {
              confirmButton: 'btn btn-primary'
            },
            buttonsStyling: false
        });
       
}
    
  
    // Error
    function alertaError(mensaje){
        Swal.fire({
          title: 'Error!',
          text: mensaje,
          icon: 'error',
          customClass: {
            confirmButton: 'btn btn-primary'
          },
          buttonsStyling: false
        });
    }
  
    // Warning
    function alertaPeligro(mensaje){
        Swal.fire({
          title: 'Warning!',
          text:  mensaje,
          icon: 'warning',
          customClass: {
            confirmButton: 'btn btn-primary'
          },
          buttonsStyling: false
        });
    }
  
    // Info
    function alertaInfo(mensaje){
        Swal.fire({
          title: 'Info!',
          text:  mensaje,
          icon: 'info',
          customClass: {
            confirmButton: 'btn btn-primary'
          },
          buttonsStyling: false
        });
    }
    // Info
    function alertaPregunta(){
      // confirmColor.on('click', function () {
        Swal.fire({
          title: 'Are you sure?',
          text: "You won't be able to revert this!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Yes, delete it!',
          customClass: {
            confirmButton: 'btn btn-primary',
            cancelButton: 'btn btn-outline-danger ml-1'
          },
          buttonsStyling: false
        }).then(function (result) {
          if (result.value) {
            Swal.fire({
              icon: 'success',
              title: 'Deleted!',
              text: 'Your file has been deleted.',
              customClass: {
                confirmButton: 'btn btn-success'
              }
            });
          } else if (result.dismiss === Swal.DismissReason.cancel) {
            Swal.fire({
              title: 'Cancelled',
              text: 'Your imaginary file is safe :)',
              icon: 'error',
              customClass: {
                confirmButton: 'btn btn-success'
              }
            });
          }
        });
      // });
    }
  
    //--------------- Options ---------------
  
 
    //--------------- Confirm Options ---------------
  
    // Confirm Text
    // if (confirmText.length) {
    //   confirmText.on('click', function () {
    //     Swal.fire({
    //       title: 'Are you sure?',
    //       text: "You won't be able to revert this!",
    //       icon: 'warning',
    //       showCancelButton: true,
    //       confirmButtonText: 'Yes, delete it!',
    //       customClass: {
    //         confirmButton: 'btn btn-primary',
    //         cancelButton: 'btn btn-outline-danger ml-1'
    //       },
    //       buttonsStyling: false
    //     }).then(function (result) {
    //       if (result.value) {
    //         Swal.fire({
    //           icon: 'success',
    //           title: 'Deleted!',
    //           text: 'Your file has been deleted.',
    //           customClass: {
    //             confirmButton: 'btn btn-success'
    //           }
    //         });
    //       }
    //     });
    //   });
    // }
  
    // // Confirm Color
    // if (confirmColor.length) {
    //   confirmColor.on('click', function () {
    //     Swal.fire({
    //       title: 'Are you sure?',
    //       text: "You won't be able to revert this!",
    //       icon: 'warning',
    //       showCancelButton: true,
    //       confirmButtonText: 'Yes, delete it!',
    //       customClass: {
    //         confirmButton: 'btn btn-primary',
    //         cancelButton: 'btn btn-outline-danger ml-1'
    //       },
    //       buttonsStyling: false
    //     }).then(function (result) {
    //       if (result.value) {
    //         Swal.fire({
    //           icon: 'success',
    //           title: 'Deleted!',
    //           text: 'Your file has been deleted.',
    //           customClass: {
    //             confirmButton: 'btn btn-success'
    //           }
    //         });
    //       } else if (result.dismiss === Swal.DismissReason.cancel) {
    //         Swal.fire({
    //           title: 'Cancelled',
    //           text: 'Your imaginary file is safe :)',
    //           icon: 'error',
    //           customClass: {
    //             confirmButton: 'btn btn-success'
    //           }
    //         });
    //       }
    //     });
    //   });
    // }

  