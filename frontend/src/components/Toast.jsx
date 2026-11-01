import { useEffect } from 'react';
import { useToast } from '../context/ToastContext';

const Toast = () => {
  const { toast, hideToast } = useToast();

  useEffect(() => {
    if (toast.visible) {
      const timer = setTimeout(() => {
        hideToast();
      }, 2000);
      return () => clearTimeout(timer);
    }
  }, [toast.visible, hideToast]);

  if (!toast.visible) return null;

  return (
    <div className={`toast toast-${toast.type}`}>
      {toast.message}
    </div>
  );
};

export default Toast;
