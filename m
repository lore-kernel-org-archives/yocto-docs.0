Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE50FCD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:43:05 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44079.1781880184729149202
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ha710dwU;
 spf=pass (domain: cherry.de, ip: 52.101.66.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WN9v+JuflRDjMuTO1vBOgz6V4estD7JRZIY4x2iVebS395iHcDUTFWeJS5QyxgO22x5wxlV9G885cbMk+SJTbPxRi+1uz2PF4vTUcVB+ZLsnOtSMI4/hbI2EGStK9qwIhuWwmNJu1Xj1KBZyaM+373THPp9JplKC8rHfCD2y/z7ERHJ3dCdFaTJiwI9XD/Hg6BlkGvP8bKASeBFN/xbNDAQwzZowf8mvsCZJcV06wVuRAw7Un/4wOVWg1ae/wfwZx5QWZYN3OWDKEmgXxfjFsDfL1jU3/+994flkQZaeyf0YLy81j6JrLKUEqDkILRL3niFOfem6HrVGrZda7zgjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofiGIpmSjoKnyVMVo+SSrwNmlR3aKlDLPlMFKM/zzMs=;
 b=OmPtyxQdF7L4nk7Ze3/SlCjKzlII3BYVgVnjJdpAPQf1PvyBIh+F/gqo/W1AID/WtZBJ7ExFALXfrwMb/zZ85GsBf+Z2VSf6Hpg6oNL9vF4d6jB8tNkN63HA5kN9P4N+i59QcoEQG5VHpPOELIK4RX477x0/rUHSbd4FE7L7mNimUmmkqLhi4TbYWHzoRUb3EVI7il0KsSPwN56j8hy0VYyj2B4RXWDJB159x57MAiBVPliQB4CcukalAt7cnbfkWlqK7GPDDEHMT6CtAi1LGVfXnkn4TUiTHW1k5mXGuqoS8lXVTfWi6LwGhRuzOLJE58C4oVPYMqcYwo0wYRjERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofiGIpmSjoKnyVMVo+SSrwNmlR3aKlDLPlMFKM/zzMs=;
 b=Ha710dwUDZZkdt/uEc/zbFzP9r9Fk8q10j0Srzu4vG6NCT0OxDQ4vg2PdppLGis12KF93wshF+f8Vt4ffm00C7B1jSzp4gYWnn1CIVQNlUdM/1DG9WOFQnMbeHjvQijCOYF3UwHuRDCMzJSObJB5S5Obt/kkycCjubuGKdMnIGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI1PR04MB9953.eurprd04.prod.outlook.com (2603:10a6:800:1d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 14:43:00 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:43:00 +0000
Message-ID: <3f5d0636-5266-443d-acbe-e9974898d015@cherry.de>
Date: Fri, 19 Jun 2026 16:42:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: change "setup" to "set up" when used
 as an action
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <b74ab4e0-603a-9753-da0e-2b3cbe7e8afb@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b74ab4e0-603a-9753-da0e-2b3cbe7e8afb@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI1PR04MB9953:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eafc0f9-30ed-4c35-af3c-08dece110fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	5Ir1603tX/cP/d5MzxJl2rMTRsoepCCX8gyhbgxFNnWmgST8g2A2+5BTE02vu3d/n1TciZY9TDcfbyxD85JVlXY/aYPsHo/mqdWGwUApbvqiwJDQ41S1aRR/BT4SJP3PO4QttcW4iYYCg3UUzswLzSoEeuFHVago1JWyYyu1N0DmPR7aOadwyDNx/tByDrOyU5bcEJdCbZprIPcka4sq4G3VTG5IC0YHfR1uXgC2yiE++RA2Guwax/+I1GLvRb+eC77mOYo6ZfWrnN59tyg4SmKVQrDosXulmPqNPqbngi1bD0oc4oDkJr6xVvKQGirRgJwMX40p4H9hliuBOkO5BU7Fbb8tEQ4i3cqnA+7bB2S934WDG4iNN4pyXDCL981Rjn6yBo0rZrV3wEpGEupjn7h+Gwj0zvhcvxKONJ/JF+K0GEAk73mNQwXB52lE3bYCiu8rfEoGmADU+WzMkllKrxJOhby1ZRtAoS/DHEQ42j22MNW5NO74mdi1KxPL9d2mlHZCV+fqO/Rpt0NUPjmzCEdPK89F8ivisZdUjNRRvhDkFzAxNF8D/GTiW8wVYI689a772tcetnQyXnhlnF+TH4L6ve9MeDc+MpoeHTQjECRZ/5/dUYedhlelpAF9+CEY7oGB6lrUIYyR5kIwhmDR3xaNLii82htpVMw72Lba4lE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUlIVVRnNnkyUXRpUjQ3T2NhK1pNTWd5UXFGRTdoN0VXNzVzVjJGeXVQc3VP?=
 =?utf-8?B?c2RXVHJKSUVna0hPV1duUVlpUHQ5MjNOTFU3RDNHQlUzcFJOZGgyNDRUY2hr?=
 =?utf-8?B?d2l2Um9xejFsKzFuTUZmaE03eG1QeUhxbTN1VGt2THdxdkN1eHhtdUFJL1Iw?=
 =?utf-8?B?RkF3eWZNMmt5WmxhRmZpbzBxaE9scVV6SW0vOVVXa3FDbzVobHlVa0QzR0F4?=
 =?utf-8?B?RDBzdEZtSVRvZmd3dUlFdWNJVExUM0lTdmNJeEdVamlXRGRYcmdhYUQxRGR2?=
 =?utf-8?B?TTRXaUZEa0pIN1d5bTExMHZOWk1Hckp4VGUzTHMrUGI5ay9SSHFVdHNuMmFG?=
 =?utf-8?B?VTVFQU5IL1F2bnZKWDIwWnVKTElZdWJRTVFwcWxJWG5WTWtZZ2VCY3hlK2FR?=
 =?utf-8?B?dStpUjg2cmQybHhnaGZaWUtYTlh5QUwxd3hVd2FXUThOYzA1NDdzZitMSjZH?=
 =?utf-8?B?NVJMZGM5eW9aQzFqd0RyVkdCV2tVUlRzUmVnTjhETHBKSkdVUnJXZ1NLT2g1?=
 =?utf-8?B?em9ZRFM5L1dPN0diczA4U2oxcHloY3FRZ013aEY4SStYTHhEMFJibDEyMjZt?=
 =?utf-8?B?MCtiaW1GeENFazFTNFpkNUkrc3ZicTQ5amVrUXhQVDlKY3h0QVdLL3RwbXRv?=
 =?utf-8?B?STBpS2NYN3pIY0poN0RoVXloZm5Rcld6RnQrTHdkV2dJb3ZpZk9jbHBXNjVq?=
 =?utf-8?B?NkVXMGNLejdQRi9MU1lKczRFZFdFUWNIRTZaOXJBRitkdS9ITWdqNFY5bmFJ?=
 =?utf-8?B?NHcyM2pHcEhFOHhWQVNWRmlUdGJYY202QXo0REJDUkhIM0dWQkVyYXhUWWFB?=
 =?utf-8?B?TUVVWlZxZ09jYVZXT2JtcDlkNVJvK1NMZzJVWjh1bVFwTmJFL3FFd1h3L00y?=
 =?utf-8?B?Y1JCRDRhVkhFR0VIa3hteUJScytIUkJHcXF3RXF4aFVTdVZMS1FSbTNaRHZT?=
 =?utf-8?B?QkZWSjlkSi9kYmxHSHRXSGp1QjFveDVMSkJJRHY1MHJldU1SUXRvL2hyck4x?=
 =?utf-8?B?RnZoT2o0dEd5VHhEQzJBNWwyTjRzSVpVZVN2b2twZ1c3Z0JqV0NnMjJCcUo5?=
 =?utf-8?B?S0gyemRKSi84MHUwWFV6aThSVUtVM1o5VjRIZi9HbEpySFcvM0I0SDRsRFh2?=
 =?utf-8?B?bHhiblJ0WHhJZ3J5dDRPaS83T0lqRzdJSDlabWVWUkxvZWcvd2x0c3QzdzlC?=
 =?utf-8?B?VzNpSmFqdlVJNlRjNkNxSTFyaTRTN01NYkM2YnhoZTZHdTNGVm5VNlRjVFor?=
 =?utf-8?B?SkZjM2tXcGl0dUlVUFczR1N3U3VHU1lzSkwzQzd4Q3BKZ3N2SUY5UHh4ay90?=
 =?utf-8?B?WlAveHhOSnpkRWtPQTZaR2p2dVk1YldCTGlnVmVCK1g4aTBHbWhiM2lxZDA5?=
 =?utf-8?B?VGZVdmo2OVlLbWhXam5xaDNWTFhwcXpVV05ZMlBaY20rQnNtWnI3dGxpMTZq?=
 =?utf-8?B?YlVLWVh6ZVB3SEF1Qm01ME9ZOVRwRCtoUjNwNlBPN2Fybm9PKzMwV2Qwdllx?=
 =?utf-8?B?bXdSbU5pdzJreDgvZ1NhYnJaUlJHcnk4Z0VXUXNBWlRhSml4aEo1RmxHWURC?=
 =?utf-8?B?NHJlRXdQYnZpM2hOUURKeFNkcmJjVTFVU3RRNHZWV2x4d3pEVHhUaUgrQ1NN?=
 =?utf-8?B?VTFjUVRzMFRRa3lXUm1seFpMdlFwd2FjNklpM2hjb3VBODBob2Nnd3hRckZ3?=
 =?utf-8?B?UzhXLzhzVU85R0NiRzI3QzNHeU4vUVhvU1lkaXBoV2RPVzltTk9DM2VNUWlN?=
 =?utf-8?B?Yi96UVl1L2tBYUQ4MFR3a2pDcEF6cXJTM2VLNWlWdkJIVjRrODkrSHFXR2hE?=
 =?utf-8?B?UjRRMzBZV21sMmk0ZjBDd3N4MXNOQjUvNkRqQk9KYm1xZjdwUzh5aERLYzNn?=
 =?utf-8?B?WG9DQ0Z2c0crUlZwMFBOSlpDY0svTXZobWdjSTF3Q05vZUFQbGpwSFJoNUVu?=
 =?utf-8?B?QkFaS2JoazJWQkNKWU8wZlpraXo2cnBYU3hadGF2R3I2L3ZzQi9MWTYrMDhy?=
 =?utf-8?B?MGNYRHBqcGlYellpN2k0YXpvOGUyb3B6ZStaUC9ORlFYbDQvOU9STjRhdnRR?=
 =?utf-8?B?Q0JDMDY0YXpYYnF3RkVkeWdSU0taMXZHcnFOaW0rRmpxdmhnajU2QlhqNjZO?=
 =?utf-8?B?K2pEQ1VDR1pGUEk3TThUSU1zRjZXaFY0KzU0UHlUbHcwa2FTVzVCOFo2N0w5?=
 =?utf-8?B?djJSQVl0L1FUYkU4VlF4UzkwanFOb1ZnZmxLYTZZRGI4TGdNRlVtV3FCaTFU?=
 =?utf-8?B?YzFndlp3UDJ2WlNTa2d0Y1YyTllqRjUyZGhjTWlWdGlobUd5blJ4TXdnM2xR?=
 =?utf-8?B?b2pZN3pOVVN2OXROU2ZId1QvTjZmMjlxLzBZQVViS2llNGtQRnplQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eafc0f9-30ed-4c35-af3c-08dece110fa5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:43:00.6271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUk00ruZwTvioTIanvTJrbe9ys97AVD+zZuDbk84dED6vH+cni0+R5bWUFPqlJ6YKmnBwicGg+Kxuvd6+12xqMwlcFSkeYc1g5ltxVdvVJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9953
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:43:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9790

Hi Robert,

On 6/10/26 11:01 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Similar to the change in the Overview Manual, the proper spelling is
> "setup" when a noun but "set up" when representing an action. This
> change is dev manual-wide.
> 
> There appear to be no similar changes related to "checkout" versus
> "check out."
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

