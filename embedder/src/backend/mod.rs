use smithay::backend::session::libseat::LibSeatSession;

pub mod drm_backend;
pub mod x11_client;

pub trait Backend {
    const HAS_RELATIVE_MOTION: bool = false;

    fn seat_name(&self) -> String;

    fn get_session(&self) -> LibSeatSession;
}
