//
//  BaseViewModel.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/02/2021.
//

import Foundation
import RxSwift


class BaseViewModel<ViewState, PartialViewState, Event>: ViewModelType {
    
    typealias ViewState = ViewState
    typealias PartialViewState = PartialViewState
    typealias Event = Event
    
    private var eventsSubject: PublishSubject<Event> = PublishSubject<Event>()

    var events: Observable<Event> {
        eventsSubject
    }
    
    private lazy var viewStateSubject: BehaviorSubject<ViewState> = {
        return BehaviorSubject<ViewState>(value: initNewViewState())
    }()

    var viewState: Observable<ViewState> {
        viewStateSubject
    }
    
    var currentViewState: ViewState {
        do {
            return try viewStateSubject.value()
        } catch {
            return initNewViewState()
        }
    }
    
    func emitEvent(events: [Event]) {
        events.forEach {
            eventsSubject.onNext($0)
        }
    }

    func setViewState(viewState: ViewState) {
        viewStateSubject.onNext(viewState)
    }

    func updatePartialViewState(partialStates: [PartialViewState], disposeBag: DisposeBag) {
        Observable.from(partialStates)
            .scan(currentViewState) { (currentState, partialState) -> ViewState in
                return self.reduceViewState(currentState: currentState, partialState: partialState)
            }
            .subscribe { (newViewState) in
                self.setViewState(viewState: newViewState)
            }
            .disposed(by: disposeBag)
    }
    
    func reduceViewState(currentState: ViewState, partialState: PartialViewState) -> ViewState {
        preconditionFailure("This method must be overridden")
    }

    func initNewViewState() -> ViewState {
        preconditionFailure("This method must be overridden")
    }
    
}
