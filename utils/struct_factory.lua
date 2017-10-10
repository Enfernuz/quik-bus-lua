package.path = "../?.lua;" .. package.path

local qlua_structs = require("messages.qlua_structures_pb")
local qlua_events = require("messages.qlua_events_pb")
local utils = require("utils.utils")

local assert = assert
local tostring = assert(tostring)
local error = assert(error)

local value_to_string_or_empty_string = assert(utils.value_to_string_or_empty_string)
local value_or_empty_string = assert(utils.value_or_empty_string)

local StructFactory = {}

function StructFactory.create_Firm(firm, existing_struct)

  if firm == nil then error("No firm provided.", 2) end

  local result = (existing_struct == nil and qlua_structs.Firm() or existing_struct)
  
  result.firmid = utils.Cp2151ToUtf8(firm.firmid)
  result.firm_name = value_or_empty_string(firm.firm_name)
  result.status = firm.status
  result.exchange = value_or_empty_string(firm.exchange)
  
  return result
end

function StructFactory.create_AllTrade(alltrade, existing_struct)
  
  if alltrade == nil then error("No alltrade provided.", 2) end
  
  local result = (existing_struct == nil and qlua_structs.AllTrade() or existing_struct)
  
  result.trade_num = alltrade.trade_num
  result.flags = alltrade.flags
  result.price = tostring( assert(alltrade.price, "The given 'alltrade' table has no 'price' field.") )
  result.qty = alltrade.qty
  result.value = value_to_string_or_empty_string(alltrade.value)
  result.accruedint = value_to_string_or_empty_string(alltrade.accruedint)
  result.yield = value_to_string_or_empty_string(alltrade.yield)
  result.settlecode = value_or_empty_string(alltrade.settlecode)
  result.reporate = value_to_string_or_empty_string(alltrade.reporate)
  result.repovalue = value_to_string_or_empty_string(alltrade.repovalue)
  result.repo2value = value_to_string_or_empty_string(alltrade.repo2value)
  result.repoterm = value_to_string_or_empty_string(alltrade.repoterm)
  result.sec_code = alltrade.sec_code
  result.class_code = alltrade.class_code
  utils.copy_datetime(result.datetime, assert(alltrade.datetime, "The given 'alltrade' table has no 'datetime' field."))
  result.period = alltrade.period
  result.open_interest = value_to_string_or_empty_string(alltrade.open_interest)
  result.exchange_code = value_or_empty_string(alltrade.exchange_code)
  
  return result
end

function StructFactory.create_Trade(trade, existing_struct)
  
  if trade == nil then error("No trade provided.", 2) end
  
  local result = (existing_struct == nil and qlua_structs.Trade() or existing_struct)
  
  result.trade_num = trade.trade_num
  result.order_num = trade.order_num
  result.brokerref = value_or_empty_string(trade.brokerref)
  result.userid = value_or_empty_string(trade.userid)
  result.firmid = value_or_empty_string(trade.firmid)
  result.canceled_uid = value_to_string_or_empty_string(trade.canceled_uid)
  result.account = value_or_empty_string(trade.account)
  result.price = tostring( assert(trade.price, "The given 'trade' table has no 'price' field.") )
  result.qty = trade.qty
  result.value = tostring( assert(trade.value, "The given 'trade' table has no 'value' field.") )
  result.accruedint = value_to_string_or_empty_string(trade.accruedint)
  result.yield = value_to_string_or_empty_string(trade.yield)
  result.settlecode = value_or_empty_string(trade.settlecode)
  result.cpfirmid = value_or_empty_string(trade.cpfirmid)
  result.flags = trade.flags
  result.price2 = value_to_string_or_empty_string(trade.price2)
  result.reporate = value_to_string_or_empty_string(trade.reporate)
  result.client_code = value_or_empty_string(trade.client_code)
  result.accrued2 = value_to_string_or_empty_string(trade.accrued2)
  result.repoterm = value_to_string_or_empty_string(trade.repoterm)
  result.repovalue = value_to_string_or_empty_string(trade.repovalue)
  result.repo2value = value_to_string_or_empty_string(trade.repo2value)
  result.start_discount = value_to_string_or_empty_string(trade.start_discount)
  result.lower_discount = value_to_string_or_empty_string(trade.lower_discount)
  result.upper_discount = value_to_string_or_empty_string(trade.upper_discount)
  result.block_securities = value_to_string_or_empty_string(trade.block_securities)
  result.clearing_comission = value_to_string_or_empty_string(trade.clearing_comission)
  result.exchange_comission = value_to_string_or_empty_string(trade.exchange_comission)
  result.tech_center_comission = value_to_string_or_empty_string(trade.tech_center_comission)
  result.settle_date = value_to_string_or_empty_string(trade.settle_date)
  result.settle_currency = value_or_empty_string(trade.settle_currency)
  result.trade_currency = value_or_empty_string(trade.trade_currency)
  result.exchange_code = value_or_empty_string(trade.exchange_code)
  result.station_id = value_or_empty_string(trade.station_id)
  result.sec_code = trade.sec_code
  result.class_code = trade.class_code
  utils.copy_datetime(result.datetime, trade.datetime)
  result.bank_acc_id = value_or_empty_string(trade.bank_acc_id)
  result.broker_comission = value_to_string_or_empty_string(trade.broker_comission)
  result.linked_trade = value_to_string_or_empty_string(trade.linked_trade)
  result.period = trade.period
  result.trans_id = value_to_string_or_empty_string(trade.trans_id)
  result.kind = trade.kind
  result.clearing_bank_accid = value_or_empty_string(trade.clearing_bank_accid)
  if trade.canceled_datetime then utils.copy_datetime(result.canceled_datetime, trade.canceled_datetime) end
  result.clearing_firmid = value_or_empty_string(trade.clearing_firmid)
  result.system_ref = value_or_empty_string(trade.system_ref)
  result.uid = value_to_string_or_empty_string(trade.uid)
  
  return result
end

function StructFactory.create_Order(order, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.Order() or existing_struct)
  
  result.order_num = order.order_num
  result.flags = order.flags
  result.brokerref = value_or_empty_string(order.brokerref)
  result.userid = value_or_empty_string(order.userid)
  result.firmid = value_or_empty_string(order.firmid)
  result.account = value_or_empty_string(order.account)
  result.price = tostring(order.price)
  result.qty = tostring(order.qty)
  result.balance = value_to_string_or_empty_string(order.balance)
  result.value = tostring(order.value)
  result.accruedint = value_to_string_or_empty_string(order.accruedint)
  result.yield = value_to_string_or_empty_string(order.yield)
  result.trans_id = value_to_string_or_empty_string(order.trans_id)
  result.client_code = value_or_empty_string(order.client_code)
  result.price2 = value_to_string_or_empty_string(order.price2)
  result.settlecode = value_or_empty_string(order.settlecode)
  result.uid = value_to_string_or_empty_string(order.uid)
  result.canceled_uid = value_to_string_or_empty_string(order.canceled_uid)
  result.exchange_code = value_or_empty_string(order.exchange_code)
  result.activation_time = value_to_string_or_empty_string(order.activation_time)
  result.linkedorder = value_to_string_or_empty_string(order.linkedorder)
  result.expiry = value_to_string_or_empty_string(order.expiry)
  result.sec_code = order.sec_code
  result.class_code = order.class_code
  utils.copy_datetime(result.datetime, order.datetime)
  if order.withdraw_datetime ~= nil then utils.copy_datetime(result.withdraw_datetime, order.withdraw_datetime) end
  result.bank_acc_id = value_or_empty_string(order.bank_acc_id)
  result.value_entry_type = order.value_entry_type
  result.repoterm = value_to_string_or_empty_string(order.repoterm)
  result.repovalue = value_to_string_or_empty_string(order.repovalue)
  result.repo2value = value_to_string_or_empty_string(order.repo2value)
  result.repo_value_balance = value_to_string_or_empty_string(order.repo_value_balance)
  result.start_discount = value_to_string_or_empty_string(order.start_discount)
  result.reject_reason = value_or_empty_string(order.reject_reason)
  result.ext_order_flags = value_to_string_or_empty_string(order.ext_order_flags)
  result.min_qty = order.min_qty
  result.exec_type = order.exec_type
  result.side_qualifier = order.side_qualifier
  result.acnt_type = order.acnt_type
  result.capacity = order.capacity
  result.passive_only_order = order.passive_only_order
  result.visible = order.visible
  
  return result
end

function StructFactory.create_AccountBalance(acc_bal, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.AccountBalance() or existing_struct)
  
  result.firmid = acc_bal.firmid
  result.sec_code = acc_bal.sec_code
  result.trdaccid = acc_bal.trdaccid
  result.depaccid = acc_bal.depaccid
  result.openbal = tostring(acc_bal.openbal)
  result.currentpos = tostring(acc_bal.currentpos)
  result.plannedpossell = value_to_string_or_empty_string(acc_bal.plannedpossell)
  result.plannedposbuy = value_to_string_or_empty_string(acc_bal.plannedposbuy)
  result.planbal = value_to_string_or_empty_string(acc_bal.planbal)
  result.usqtyb = value_to_string_or_empty_string(acc_bal.usqtyb)
  result.usqtys = value_to_string_or_empty_string(acc_bal.usqtys)
  result.planned = value_to_string_or_empty_string(acc_bal.planned)
  result.settlebal = value_to_string_or_empty_string(acc_bal.settlebal)
  result.bank_acc_id = value_or_empty_string(acc_bal.bank_acc_id)
  result.firmuse = acc_bal.firmuse
  
  return result
end

function StructFactory.create_FuturesLimit(fut_limit, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.FuturesLimit() or existing_struct)
  
  result.firmid = fut_limit.firmid
  result.trdaccid = fut_limit.trdaccid
  result.limit_type = fut_limit.limit_type
  result.liquidity_coef = value_to_string_or_empty_string(fut_limit.liquidity_coef)
  result.cbp_prev_limit = value_to_string_or_empty_string(fut_limit.cbp_prev_limit)
  result.cbplimit = value_to_string_or_empty_string(fut_limit.cbplimit)
  result.cbplused = value_to_string_or_empty_string(fut_limit.cbplused)
  result.cbplplanned = value_to_string_or_empty_string(fut_limit.cbplplanned)
  result.varmargin = value_to_string_or_empty_string(fut_limit.varmargin)
  result.accruedint = value_to_string_or_empty_string(fut_limit.accruedint)
  result.cbplused_for_orders = value_to_string_or_empty_string(fut_limit.cbplused_for_orders)
  result.cbplused_for_positions = value_to_string_or_empty_string(fut_limit.cbplused_for_positions)
  result.options_premium = value_to_string_or_empty_string(fut_limit.options_premium)
  result.ts_comission = value_to_string_or_empty_string(fut_limit.ts_comission)
  result.kgo = value_to_string_or_empty_string(fut_limit.kgo)
  result.currcode = fut_limit.currcode
  result.real_varmargin = value_to_string_or_empty_string(fut_limit.real_varmargin)
  
  return result
end

function StructFactory.create_FuturesLimitDelete(lim_del, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.FuturesLimitDelete() or existing_struct)
  
  result.firmid = lim_del.firmid
  result.limit_type = lim_del.limit_type
  
  return result
end

function StructFactory.create_FuturesClientHolding(fut_pos, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.FuturesClientHolding() or existing_struct)
  
  result.firmid = fut_pos.firmid
  result.trdaccid = fut_pos.trdaccid
  result.sec_code = fut_pos.sec_code
  result.type = fut_pos.type
  result.startbuy = value_to_string_or_empty_string(fut_pos.startbuy)
  result.startsell = value_to_string_or_empty_string(fut_pos.startsell)
  result.todaybuy = value_to_string_or_empty_string(fut_pos.todaybuy)
  result.todaysell = value_to_string_or_empty_string(fut_pos.todaysell)
  result.totalnet = value_to_string_or_empty_string(fut_pos.totalnet)
  result.openbuys = fut_pos.openbuys
  result.opensells = fut_pos.opensells
  result.cbplused = value_to_string_or_empty_string(fut_pos.cbplused)
  result.cbplplanned = value_to_string_or_empty_string(fut_pos.cbplplanned)
  result.varmargin = value_to_string_or_empty_string(fut_pos.varmargin)
  result.avrposnprice = value_to_string_or_empty_string(fut_pos.avrposnprice)
  result.positionvalue = value_to_string_or_empty_string(fut_pos.positionvalue)
  result.real_varmargin = value_to_string_or_empty_string(fut_pos.real_varmargin)
  result.total_varmargin = value_to_string_or_empty_string(fut_pos.total_varmargin)
  result.session_status = fut_pos.session_status
  
  return result
end

function StructFactory.create_MoneyLimit(mlimit, existing_struct)

  local result = (existing_struct == nil and qlua_structs.MoneyLimit() or existing_struct)
  
  result.currcode = value_or_empty_string(mlimit.currcode)
  result.tag = value_or_empty_string(mlimit.tag)
  result.firmid = value_or_empty_string(mlimit.firmid)
  result.client_code = value_or_empty_string(mlimit.client_code)
  result.openbal = value_to_string_or_empty_string(mlimit.openbal)
  result.openlimit = value_to_string_or_empty_string(mlimit.openlimit)
  result.currentbal = value_to_string_or_empty_string(mlimit.currentbal)
  result.currentlimit = value_to_string_or_empty_string(mlimit.currentlimit)
  result.locked = value_to_string_or_empty_string(mlimit.locked)
  result.locked_value_coef = value_to_string_or_empty_string(mlimit.locked_value_coef)
  result.locked_margin_value = value_to_string_or_empty_string(mlimit.locked_margin_value)
  result.leverage = value_to_string_or_empty_string(mlimit.leverage)
  result.limit_kind = mlimit.limit_kind
  
  return result
end

function StructFactory.create_MoneyLimitDelete(mlimit_del, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.MoneyLimitDelete() or existing_struct)
  
  result.currcode = mlimit_del.currcode
  result.tag = value_or_empty_string(mlimit_del.tag)
  result.client_code = mlimit_del.client_code
  result.firmid = mlimit_del.firmid
  result.limit_kind = mlimit_del.limit_kind
  
  return result
end

function StructFactory.create_DepoLimit(dlimit, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.DepoLimit() or existing_struct)
  
  result.sec_code = dlimit.sec_code
  result.trdaccid = dlimit.trdaccid
  result.firmid = dlimit.firmid
  result.client_code = dlimit.client_code
  result.openbal = dlimit.openbal
  result.openlimit = dlimit.openlimit
  result.currentbal = dlimit.currentbal
  result.currentlimit = dlimit.currentlimit
  result.locked_sell = dlimit.locked_sell
  result.locked_buy = dlimit.locked_buy
  result.locked_buy_value = value_to_string_or_empty_string(dlimit.locked_buy_value)
  result.locked_sell_value = value_to_string_or_empty_string(dlimit.locked_sell_value)
  result.awg_position_price = value_to_string_or_empty_string(dlimit.awg_position_price)
  result.limit_kind = dlimit.limit_kind
  
  return result
end

function StructFactory.create_DepoLimitDelete(dlimit_del, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.DepoLimitDelete() or existing_struct)
  
  result.sec_code = dlimit_del.sec_code
  result.trdaccid = dlimit_del.trdaccid
  result.firmid = dlimit_del.firmid
  result.client_code = dlimit_del.client_code
  result.limit_kind = dlimit_del.limit_kind
  
  return result
end

function StructFactory.create_AccountPosition(acc_pos, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.AccountPosition() or existing_struct)
  
  result.firmid = acc_pos.firmid
  result.currcode = acc_pos.currcode
  result.tag = value_or_empty_string(acc_pos.tag)
  result.description = value_or_empty_string(acc_pos.description)
  result.openbal = value_to_string_or_empty_string(acc_pos.openbal)
  result.currentpos = value_to_string_or_empty_string(acc_pos.currentpos)
  result.plannedpos = value_to_string_or_empty_string(acc_pos.plannedpos)
  result.limit1 = value_to_string_or_empty_string(acc_pos.limit1)
  result.limit2 = value_to_string_or_empty_string(acc_pos.limit2)
  result.orderbuy = value_to_string_or_empty_string(acc_pos.orderbuy)
  result.ordersell = value_to_string_or_empty_string(acc_pos.ordersell)
  result.netto = value_to_string_or_empty_string(acc_pos.netto)
  result.plannedbal = value_to_string_or_empty_string(acc_pos.plannedbal)
  result.debit = value_to_string_or_empty_string(acc_pos.debit)
  result.credit = value_to_string_or_empty_string(acc_pos.credit)
  result.bank_acc_id = value_or_empty_string(acc_pos.bank_acc_id)
  result.margincall = value_to_string_or_empty_string(acc_pos.margincall)
  result.settlebal = value_to_string_or_empty_string(acc_pos.settlebal)
  
  return result
end

function StructFactory.create_NegDeal(neg_deal, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.NegDeal() or existing_struct)
  
  result.neg_deal_num = neg_deal.neg_deal_num
  result.neg_deal_time = value_to_string_or_empty_string(neg_deal.neg_deal_time)
  result.flags = neg_deal.flags
  result.brokerref = value_or_empty_string(neg_deal.brokerref)
  result.userid = value_or_empty_string(neg_deal.userid)
  result.firmid = value_or_empty_string(neg_deal.firmid)
  result.cpuserid = value_or_empty_string(neg_deal.cpuserid)
  result.cpfirmid = value_or_empty_string(neg_deal.cpfirmid)
  result.account = value_or_empty_string(neg_deal.account)
  result.price = tostring(neg_deal.price)
  result.qty = neg_deal.qty
  result.matchref = value_or_empty_string(neg_deal.matchref)
  result.settlecode = value_or_empty_string(neg_deal.settlecode)
  result.yield = value_to_string_or_empty_string(neg_deal.yield)
  result.accruedint = value_to_string_or_empty_string(neg_deal.accruedint)
  result.value = value_to_string_or_empty_string(neg_deal.value)
  result.price2 = value_to_string_or_empty_string(neg_deal.price2)
  result.reporate = value_to_string_or_empty_string(neg_deal.reporate)
  result.refundrate = value_to_string_or_empty_string(neg_deal.refundrate)
  result.trans_id = value_to_string_or_empty_string(neg_deal.trans_id)
  result.client_code = value_or_empty_string(neg_deal.client_code)
  result.repoentry = neg_deal.repoentry
  result.repovalue = value_to_string_or_empty_string(neg_deal.repovalue)
  result.repo2value = value_to_string_or_empty_string(neg_deal.repo2value)
  result.repoterm = value_to_string_or_empty_string(neg_deal.repoterm)
  result.start_discount = value_to_string_or_empty_string(neg_deal.start_discount)
  result.lower_discount = value_to_string_or_empty_string(neg_deal.lower_discount)
  result.upper_discount = value_to_string_or_empty_string(neg_deal.upper_discount)
  result.block_securities = value_to_string_or_empty_string(neg_deal.block_securities)
  result.uid = value_to_string_or_empty_string(neg_deal.uid)
  result.withdraw_time = value_to_string_or_empty_string(neg_deal.withdraw_time)
  result.neg_deal_date = value_to_string_or_empty_string(neg_deal.neg_deal_date)
  result.balance = value_to_string_or_empty_string(neg_deal.balance)
  result.origin_repovalue = value_to_string_or_empty_string(neg_deal.origin_repovalue)
  result.origin_qty = value_to_string_or_empty_string(neg_deal.origin_qty)
  result.origin_discount = value_to_string_or_empty_string(neg_deal.origin_discount)
  result.neg_deal_activation_date = value_to_string_or_empty_string(neg_deal.neg_deal_activation_date)
  result.neg_deal_activation_time = value_to_string_or_empty_string(neg_deal.neg_deal_activation_time)
  result.quoteno = value_to_string_or_empty_string(neg_deal.quoteno)
  result.settle_currency = value_or_empty_string(neg_deal.settle_currency)
  result.sec_code = neg_deal.sec_code
  result.class_code = neg_deal.class_code
  result.bank_acc_id = value_or_empty_string(neg_deal.bank_acc_id)
  result.withdraw_date = value_to_string_or_empty_string(neg_deal.withdraw_date)
  result.linkedorder = value_to_string_or_empty_string(neg_deal.linkedorder)
  if neg_deal.activation_date_time ~= nil then utils.copy_datetime(result.activation_date_time, neg_deal.activation_date_time) end
  if neg_deal.withdraw_date_time ~= nil then utils.copy_datetime(result.withdraw_date_time, neg_deal.withdraw_date_time) end
  if neg_deal.date_time ~= nil then utils.copy_datetime(result.date_time, neg_deal.date_time) end
  
  return result
end

function StructFactory.create_NegTrade(neg_trade, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.NegTrade() or existing_struct)
  
  result.trade_num = neg_trade.trade_num
  result.trade_date = value_to_string_or_empty_string(neg_trade.trade_date)
  result.settle_date = value_to_string_or_empty_string(neg_trade.settle_date)
  result.flags = neg_trade.flags
  result.brokerref = value_or_empty_string(neg_trade.brokerref)
  result.firmid = value_or_empty_string(neg_trade.firmid)
  result.account = value_or_empty_string(neg_trade.account)
  result.cpfirmid = value_or_empty_string(neg_trade.cpfirmid)
  result.cpaccount = value_or_empty_string(neg_trade.cpaccount)
  result.price = tostring(neg_trade.price)
  result.qty = neg_trade.qty
  result.value = value_to_string_or_empty_string(neg_trade.value)
  result.settlecode = value_or_empty_string(neg_trade.settlecode)
  result.report_num = value_to_string_or_empty_string(neg_trade.report_num)
  result.cpreport_num = value_to_string_or_empty_string(neg_trade.cpreport_num)
  result.accruedint = value_to_string_or_empty_string(neg_trade.accruedint)
  result.repotradeno = value_to_string_or_empty_string(neg_trade.repotradeno)
  result.price1 = value_to_string_or_empty_string(neg_trade.price1)
  result.reporate = value_to_string_or_empty_string(neg_trade.reporate)
  result.price2 = value_to_string_or_empty_string(neg_trade.price2)
  result.client_code = value_or_empty_string(neg_trade.client_code)
  result.ts_comission = value_to_string_or_empty_string(neg_trade.ts_comission)
  result.balance = value_to_string_or_empty_string(neg_trade.balance)
  result.settle_time = value_to_string_or_empty_string(neg_trade.settle_time)
  result.amount = value_to_string_or_empty_string(neg_trade.amount)
  result.repovalue = value_to_string_or_empty_string(neg_trade.repovalue)
  result.repoterm = value_to_string_or_empty_string(neg_trade.repoterm)
  result.repo2value = value_to_string_or_empty_string(neg_trade.repo2value)
  result.return_value = value_to_string_or_empty_string(neg_trade.return_value)
  result.discount = value_to_string_or_empty_string(neg_trade.discount)
  result.lower_discount = value_to_string_or_empty_string(neg_trade.lower_discount)
  result.upper_discount = value_to_string_or_empty_string(neg_trade.upper_discount)
  result.block_securities = value_to_string_or_empty_string(neg_trade.block_securities)
  result.urgency_flag = value_to_string_or_empty_string(neg_trade.urgency_flag)
  result.type = neg_trade.type
  result.operation_type = neg_trade.operation_type
  result.expected_discount = value_to_string_or_empty_string(neg_trade.expected_discount)
  result.expected_quantity = value_to_string_or_empty_string(neg_trade.expected_quantity)
  result.expected_repovalue = value_to_string_or_empty_string(neg_trade.expected_repovalue)
  result.expected_repo2value = value_to_string_or_empty_string(neg_trade.expected_repo2value)
  result.expected_return_value = value_to_string_or_empty_string(neg_trade.expected_return_value)
  result.order_num = value_to_string_or_empty_string(neg_trade.order_num)
  result.report_trade_date = value_to_string_or_empty_string(neg_trade.report_trade_date)
  result.settled = neg_trade.settled
  result.clearing_type = neg_trade.clearing_type
  result.report_comission = value_to_string_or_empty_string(neg_trade.report_comission)
  result.coupon_payment = value_to_string_or_empty_string(neg_trade.coupon_payment)
  result.principal_payment = value_to_string_or_empty_string(neg_trade.principal_payment)
  result.principal_payment_date = value_to_string_or_empty_string(neg_trade.principal_payment_date)
  result.nextdaysettle = value_to_string_or_empty_string(neg_trade.nextdaysettle)
  result.settle_currency = value_or_empty_string(neg_trade.settle_currency)
  result.sec_code = neg_trade.sec_code
  result.class_code = neg_trade.class_code
  result.compval = value_to_string_or_empty_string(neg_trade.compval)
  result.parenttradeno = value_to_string_or_empty_string(neg_trade.parenttradeno)
  result.bankid = value_or_empty_string(neg_trade.bankid)
  result.bankaccid = value_or_empty_string(neg_trade.bankaccid)
  result.precisebalance = value_to_string_or_empty_string(neg_trade.precisebalance)
  result.confirmtime = value_to_string_or_empty_string(neg_trade.confirmtime)
  result.ex_flags = neg_trade.ex_flags
  result.confirmreport = value_to_string_or_empty_string(neg_trade.confirmreport)
  
  return result
end

function StructFactory.create_StopOrder(stop_order, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.StopOrder() or existing_struct)
  
  result.order_num = stop_order.order_num
  result.ordertime = value_to_string_or_empty_string(stop_order.ordertime)
  result.flags = stop_order.flags
  result.brokerref = value_or_empty_string(stop_order.brokerref)
  result.firmid = stop_order.firmid
  result.account = stop_order.account
  result.condition = stop_order.condition
  result.condition_price = tostring(stop_order.condition_price)
  result.price = tostring(stop_order.price)
  result.qty = stop_order.qty
  result.linkedorder = value_to_string_or_empty_string(stop_order.linkedorder)
  result.expiry = value_to_string_or_empty_string(stop_order.expiry)
  result.trans_id = value_to_string_or_empty_string(stop_order.trans_id)
  result.client_code = value_or_empty_string(stop_order.client_code)
  result.co_order_num = value_to_string_or_empty_string(stop_order.co_order_num)
  result.co_order_price = value_to_string_or_empty_string(stop_order.co_order_price)
  result.stop_order_type = stop_order.stop_order_type
  result.orderdate = value_to_string_or_empty_string(stop_order.orderdate)
  result.alltrade_num = value_to_string_or_empty_string(stop_order.alltrade_num)
  result.stopflags = stop_order.stopflags
  result.offset = value_to_string_or_empty_string(stop_order.offset)
  result.spread = value_to_string_or_empty_string(stop_order.spread)
  result.balance = value_to_string_or_empty_string(stop_order.balance)
  result.uid = value_to_string_or_empty_string(stop_order.uid)
  result.filled_qty = stop_order.filled_qty
  result.withdraw_time = value_to_string_or_empty_string(stop_order.withdraw_time)
  result.condition_price2 = value_to_string_or_empty_string(stop_order.condition_price2)
  result.active_from_time = value_to_string_or_empty_string(stop_order.active_from_time)
  result.active_to_time = value_to_string_or_empty_string(stop_order.active_to_time)
  result.sec_code = stop_order.sec_code
  result.class_code = stop_order.class_code
  result.condition_sec_code = value_or_empty_string(stop_order.condition_sec_code)
  result.condition_class_code = value_or_empty_string(stop_order.condition_class_code)
  result.canceled_uid = value_to_string_or_empty_string(stop_order.canceled_uid)
  utils.copy_datetime(result.order_date_time, stop_order.order_date_time)
  if stop_order.withdraw_datetime ~= nil then utils.copy_datetime(result.withdraw_datetime, stop_order.withdraw_datetime) end
  
  return result
end

function StructFactory.create_Transaction(trans_reply, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.Transaction() or existing_struct)
  
  result.trans_id = trans_reply.trans_id
  result.status = trans_reply.status
  result.result_msg = value_or_empty_string(trans_reply.result_msg)
  if trans_reply.date_time ~= nil then utils.copy_datetime(result.date_time, trans_reply.date_time) end
  result.uid = value_to_string_or_empty_string(trans_reply.uid)
  result.flags = trans_reply.flags
  result.server_trans_id = value_to_string_or_empty_string(trans_reply.server_trans_id)
  result.order_num = value_to_string_or_empty_string(trans_reply.order_num)
  result.price = value_to_string_or_empty_string(trans_reply.price)
  result.quantity = value_to_string_or_empty_string(trans_reply.quantity)
  result.balance = value_to_string_or_empty_string(trans_reply.balance)
  result.firm_id = value_or_empty_string(trans_reply.firm_id)
  result.account = value_or_empty_string(trans_reply.account)
  result.client_code = value_or_empty_string(trans_reply.client_code)
  result.brokerref = value_or_empty_string(trans_reply.brokerref)
  result.class_code = value_or_empty_string(trans_reply.class_code)
  result.sec_code = value_or_empty_string(trans_reply.sec_code)
  result.exchange_code = value_or_empty_string(trans_reply.exchange_code)
  
  return result
end

function StructFactory.create_Security(security, existing_struct)
  
  local result = (existing_struct == nil and qlua_structs.Transaction() or existing_struct)
  
  result.code = value_or_empty_string(security.code)
  result.name = value_or_empty_string(security.name)
  result.short_name = value_or_empty_string(security.short_name)
  result.class_code = value_or_empty_string(security.class_code)
  result.class_name = value_or_empty_string(security.class_name)
  result.face_value = value_to_string_or_empty_string(security.face_value)
  result.face_unit = value_or_empty_string(security.face_unit)
  result.scale = value_to_string_or_empty_string(security.scale)
  result.mat_date = value_to_string_or_empty_string(security.mat_date)
  result.lot_size = value_to_string_or_empty_string(security.lot_size)
  result.isin_code = value_or_empty_string(security.isin_code)
  result.min_price_step = value_to_string_or_empty_string(security.min_price_step)
  
  return result
end

return StructFactory
