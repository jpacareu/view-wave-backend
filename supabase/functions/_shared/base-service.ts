interface EventHandler<S, E> {
  assertNever: (event: never) => never;
}

type ExtractEvents<T> = T extends { event: infer E } ? E : never;

type ExtractMessage<T> = T extends { error: { message: infer M } } ? M
  : T extends { message: infer M } ? M
  : never;

export abstract class BaseService<S, E> implements EventHandler<S, E> {
  assertNever = (event: never): never => {
    throw new Error(`Invalid event: ${event}`);
  };

  abstract getSuccessMessages(event: ExtractEvents<S>): ExtractMessage<S>;

  abstract getErrorMessages(event: ExtractEvents<E>): ExtractMessage<E>;
}
