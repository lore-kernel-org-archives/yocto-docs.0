Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7F6D35680
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:02:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13882.1769608946075154368
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=G8Kbe/yn;
 spf=pass (domain: cherry.de, ip: 52.101.69.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnrPkVvIaxPg9Lv7SkHwwq3QXGi4lV6K+tN83eOXgkfWZGGJ2NqY9BSwgD/oPbY38RLoPQc6VPpicE5oXS7XPGgTHcE4luZoKcQTIBXBFYavWkxoRKKMPA9bLmqJozk0OkTMK8L1bKqVbXNhwGGIwi3yAduk7V1rEkNny9HzJFOj1OlZYG8VYx8kWTsptsms6bbCHoeADaVF+O7M6qrjGtv6Ba+3JotQ/O/mUHUyuQmrPGUoP2ovksX70CfdxHh5j6lMcbxwtjGmV/fnqWkLvKma+4/pCLHEHsu+Y1c4QY+FOYAJlhoobAfeqRxWvPjiM1WzCEGOEJQ7Y921kx4MqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=h5qn2UQ9he0VlNQxMopxq5JiTQNBPm4Fotisecq5X/kp6s5p8uvuLKe4VZOMnmfqtXhmEugfGToFytusKlC7Vw1Sp+Wk7XMDlb3MSBS6/THxiKLW7Tv4qQRSW1Pcpi/Y8utUWnHj4neRmcEMaGgomaJa/7vLFuOEhqcMv2/qF3rBVfbmeFv1Qp/xD5m78baefBHGvZs5G50E4nRby4MJgTmpsAM01ZhY2VX2YjjqXRX41FWARVPWKncGEKId8B77SIIKXMx3cnpjh+pPBXPkI5tJ01/N9cCUxbDoz/+YVhYaalml0NHEdKxUDMjmeGV/wxwHJmuYBQfzt3hvxzA9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=G8Kbe/ynxVO8X8LEktWcxMTDq4XPdWHhgNdBx60ZA59dizZsKjKxBvI8qET9IqqUSR4zo0URij5YmAYmYQSIa3FoxXwvlNjalmBJrzwmcTyAXCJTRWIO7sAcs7mry84L0YriWsDahQLSoImvlbIyB/+G0CuByGHVMYcQZJJv5ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 14:02:20 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:02:20 +0000
Message-ID: <d5392124-e201-441f-9c6b-602ce6e08baa@cherry.de>
Date: Wed, 28 Jan 2026 15:02:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 42/56] dev-manual/python-development-shell.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-42-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-42-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA4PR04MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 153b7a2e-59a7-4af2-1a21-08de5e75da87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bUQzWjRXdEpEaTRGTUViOWd5d1lmdDNqejEvMnBRbEhrSWlDZmxTS253UDQz?=
 =?utf-8?B?anNXMGxTeWo0VFZxUEtRdFYyUTNCTWl1Y0ptdDFjVHdTa1lVVXpTM3Bub1dJ?=
 =?utf-8?B?Wjl3QkJwcUtlVXJMVGFDbzd1QldGbFpaMUhMTnpPVEx2STBDaDJwZms4UlZ5?=
 =?utf-8?B?czhZd2JjRFhxa01mdTNSMXZxaVplUDRUOEo2WGVqQWRzRU4reUYzUmk1bkhl?=
 =?utf-8?B?UXdWWlVSUVBzKzNVU2FJcUQrVDNJREoxSHltQVIvRjFRVU5sUnFwSzB4d0NX?=
 =?utf-8?B?a2hERXk0ajBwNUUxWldjOGVyL2plUkdYQStzV3pjZjQ3VUN1OUhDSENNbW13?=
 =?utf-8?B?SU1TUVpZUFZack1ObzdKNC9aby8vSHBhWFFyZ0FkU0d1OVdwWnNUMzFpd1Fl?=
 =?utf-8?B?UTViNGVzNkFyU3BTSUVsVTg3d1JjZndVc3lha2NsSkppcTZUWXAxR3ZPekMy?=
 =?utf-8?B?VWFjWERqWDFaU1dVaEhsaFlwbDE4U1RpeWJFUGR0c2F5bXQ3bVprZTBEaGgx?=
 =?utf-8?B?VCs3cW44UkxZdTRSaklvVjRPaWxJcnlKZ0FFSklNb0hVSEdmcFdXMmhBR3F4?=
 =?utf-8?B?emFXdXAvbkZpby9zWVIrMkRKeGZYdkVSeHQvN3ZvRjBOVlF4cXh3dUdlTkJx?=
 =?utf-8?B?RnJIeTYvVHl3NEVTN1hrRzVTaHBxK1BlaWExMytiQTZzQWpsR1RQSFRDOFVm?=
 =?utf-8?B?TmlEZzBmamtmK0hFQ3FpSHEzT1ZoWFB2SlIwMUxadHBCeFBWc0dpdWsyWVlN?=
 =?utf-8?B?Y1Bid2ZaU3llOVdZb0hHWXVKaVdINkExamVmcmNTZHcvTHQvYWRZWndBMWt6?=
 =?utf-8?B?REk2LzFiNUFYRS9CTXNjWEdtSnJvVVJoMVU3V2FaSU8wZjBwSE9odUpPTmhD?=
 =?utf-8?B?VHFnS3FlMVRnMUo1Q2w1NUNYaXl4ZjFZVDFKOXJlbHlGL3BNd2JQbWwxNHBn?=
 =?utf-8?B?eGpveXVoUk44cmEvVU0vazUyZFRRTS9JRjRlc1EzN3kxZVByalNiTnZOYkd5?=
 =?utf-8?B?QTdmUnFyS3A5YTA1aGZUZDlxRTdhcDhpREtrNE5NZUlDbnFxb3NWZW1CdFB3?=
 =?utf-8?B?dmtlZFI5WURoU2g0WGswTDA0N2x3clN1YitKUTlBUG9kN0pLZDd0T212V0Fx?=
 =?utf-8?B?T3htL09RbUJqYktiVHRkUGdZajBkUTBZWlR3Ulg0enpTVkdrcjJOTTloVUlY?=
 =?utf-8?B?MjdwcXczTTJuWnh5L3dsVmpoZ3hhMXZOelh2WjFCc3BZUWJlWlh0ZjlMaWhI?=
 =?utf-8?B?NzMyaFZGcHN0c2ltN2drdnNzNmtJdDMvU3o4TVR3eUJPVHAyK3k0SzNBZlJ6?=
 =?utf-8?B?OG5FODJpR3N3ZEdzNE5GZ1ZRS3l1azUrY3QvenFra0puVDVYaWtZMWNqRk9I?=
 =?utf-8?B?K1M4d3R5ZGhvNzNxV3RKemNUR1FqMFdsbjBKT1FVdVl0VW44b0Jvbm9BWkFh?=
 =?utf-8?B?d2dncERKcnpPUzdtK2h1SUNDZDhhVHdwNEhxeXRGZFBvTnJ1R0pacFRaN0U0?=
 =?utf-8?B?TnJoRW5rTnJpVFJmZHNOWTBySzRuWXlIcXBublZDcE83RDhwWHdZSzBSREZI?=
 =?utf-8?B?dmUrWUJQbkgydkJOekxIZUlWWFd6dGNrL0pkK2ZKdHVoTWNKYXBZZFZwaXBY?=
 =?utf-8?B?Q2pzR0sxdWZCRkl3NURkbnY3NlFvQ1REeTJUQlRROXNnMDNzS0JFM0drdDBu?=
 =?utf-8?B?NE9nQS9hVnZIdDczNWEzMVF2WG53UCtER3QrbFBsTlVVZDJvbDJ5SW9ZdHFi?=
 =?utf-8?B?TlZneTg4K2hGc3djVW5rMjU1TjZvVi9DV3NFNkNqWFBmZ0ZKOTdXOERNOE9v?=
 =?utf-8?B?RjU0UG83QnR5M1p4N09CUm81VjZFdzJBd1BEd292OUFRdTJWelE3dldocXFF?=
 =?utf-8?B?MDBzVHB5bUc0WkhDMU1IMjFDTXNEWWdWaHdtc0gxb3MyaktURk9iUUJqcFZR?=
 =?utf-8?B?T1U2eUtGeWI0cVNEeklzZVZZanM2RVZwS284S1NraWQrZ083TTVJMk1yNjYr?=
 =?utf-8?B?aHQwUW5zRExISkFlZDZRN2U3eDJ2SUVBNTVtVmltM01makhGMFJQcGpsZzZI?=
 =?utf-8?B?djlvSmpwOUFZdmtMRDgvempTVG5TdUJUT3Bsa04ycWRmaWZlcWVRbXZSSE43?=
 =?utf-8?Q?UAD0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2dQd0lZaTFTdzhzQ3Nua0p2SDRCVWlkLzFibjBsMHZQcmtaQzZOZUF6Vms0?=
 =?utf-8?B?bEJjYURDSW12WnRxMEtzWHpvOGJDTVRyK2RPMWdxcHdrM0NaT1NwMDZiOW1P?=
 =?utf-8?B?dzc4TUVCaHVTc0xob0FuY1dsSDZaV3ZJT1pqYXJXV0U1K1kxZ0tDVkdveWxK?=
 =?utf-8?B?WjFSSzFaNmRraEdLS2EwT0hXWDNWOTlKSm1MUlB3bFJaVERvekdVaSt4QXp5?=
 =?utf-8?B?ZEhVWHRQT3UweUxNczI2dmFJblFwVjZFdUYxSk5CZjJtaENLRTQwRnhkaCsw?=
 =?utf-8?B?YnpQQ0ZaeWdVc1hIZ3NjLzkrVmw0MjhtbWhPeUduaEdRdUt1ZGxsTkJhdTNp?=
 =?utf-8?B?NnpHcnVkeWVHb2w5WXhtQ0FYalBrRFh3QkNYTnBOSGdCRXF1RjBZeEQxdmwy?=
 =?utf-8?B?WXJhRWEwVWluVEEwMnR5ZWtIYXBZSmdvOE9SdjY3Q1RvbjJRNDhacnhtRnJG?=
 =?utf-8?B?cWxKWjJZdXZPNlZPN2MxWGgvd1FKTlJuVjdYZUhGR3E0WFV0a0VXbDFkdS9z?=
 =?utf-8?B?MkU2SDgwRkRxQmdIRVQxem5IckloOFF6Y1lobWdjbnVpcnRIOC9WbUJCblZ5?=
 =?utf-8?B?T2ViU2d4ZEorMUZ2eFdWUFlSWDAwQTYwRFZvbWxCaTFBelFSZ1F4NTJVRGpV?=
 =?utf-8?B?UHg0NWQrUlB1SUpWMHpCYWNXazNmS0p0bVlyVEFxL0NFREZqaUp2SEZ4eVFr?=
 =?utf-8?B?Zi90RGJ4ZVRvU1NYWHBFSFFEYzFyd2FNc0wvNlVTNjMvWkdtUndNYUVwd085?=
 =?utf-8?B?c1pHNWppU3A1N0pOT0VwYWh3S3hLOUpLNGJnWkxQdGZvWnh6Qm00cTlMQ2Zs?=
 =?utf-8?B?ZFJZemdyL1VqLy8yTHAyLzJZazdBWWE3S2hwMmRMR3Y2eW41NE91dnFyZHdr?=
 =?utf-8?B?K0tKSGFBOG9VYThGdHhiL3ZxaWwydmtsSTBtQW1sNCtiYUY5TmJ0cHFmL1dk?=
 =?utf-8?B?ZEJLZ1dtbGEzZW9UK3JiWWZQQStpQkROdS9VZ2RjcE5Hd1NxZkFLQlJmN09v?=
 =?utf-8?B?ZEYxOExLbG02aVFCRkE1bUZOOGU1UFExaHF4MmQ3RU9JSUtyNFpKb0ZObUxv?=
 =?utf-8?B?UWk5ZjV0YUVqTGNqbEhBZkxWM3gvQ0VsSFVpYzh5WS9jbnlENlRnRDRVNHh1?=
 =?utf-8?B?TWI1TnVrQmdHVGpuMVBtUzdZc2tjT2lvZEswTUs1ejczd053eXNYb05DVmJW?=
 =?utf-8?B?blBFbko0VmNSKzN1UmoxMGtDM01EVXBJK0Z2NTQ4RFlXd2lPMk5zNVNZQ0di?=
 =?utf-8?B?RGVYS1ltYXY1eDhqcFpzRHE1aXFPUUM3ZlUvSmt3WE53Z2JmQmw3SW9SZVNw?=
 =?utf-8?B?NWZmVGFyakhKQjRaSHBZYnFtby9TSVNBMDU4V2JtTzNzOS9UVlg5N1h5NE5B?=
 =?utf-8?B?TU03cUhvTml3N2tPOWREQllneE81VDMvYkhjV2pFTStrcGtqaUc0eHJOcXk4?=
 =?utf-8?B?Z243eVZ5YXNVV0czaXZRaGJlNHVKYlN1cTVqWmJLUUdqN2c4SkNiTDlVZmpo?=
 =?utf-8?B?VHN1anhMS1Y1aE40RTVqbHZ6NjloSTJoR0UvUFlFR1lUcmlQaDVCaU5aOGQz?=
 =?utf-8?B?eWRnTUNaYXpnSGowOFRtTkloS0xWeTVCTjlYRlF4SGpaNHloU3p4ZW5ZSjdP?=
 =?utf-8?B?aDZNSGJxbW8vaEJBaVZoRnQ4enNaWFc5eS9DNzNhaW1RNTZVNDlhelZldlNW?=
 =?utf-8?B?RGVVL2VJQjlFYitXa0ltOUo1RGlWZ0RSTWU2M1lINFNZa3FaZjlaOElNeFY0?=
 =?utf-8?B?MFpjMExSRTZ2WFNkR0xIWDFKcVBjd3pVRzY5bGZoY2J0c21CbUFKQUEzbzZL?=
 =?utf-8?B?Vit4R0srTGFYc3dVMGhDeGMrSE5maWhHcStYd3dKSVFhNTh5VE0yZFROV3hI?=
 =?utf-8?B?NE1IWHo5SDlpS2JwR3RPb2cyVHpubTBmS0VvZ0hSUVpVYzM4Zm4weXh0T2RX?=
 =?utf-8?B?ZEN4NkxiOHZSVlpaRE5jaGdUV29XNk9uN09lU2Vrb3lEY1FxMkJaMTJndy81?=
 =?utf-8?B?RjhnL2xrVEk3L0p3T2JzTUViVjQyK2hqQ1NYcUJydlF6R1pJcEkvdE1kaDAr?=
 =?utf-8?B?eEJvTTU1YUYwVVE0djA5M09od2EzcWFpS3laRU85NDErVVJWS0plNTUrcGFH?=
 =?utf-8?B?SU8ycWZWZkNrMWp0VnViUHBvUzVLNks2aG9zZ1NFdzVDQ0crVnd0aXFDZmZL?=
 =?utf-8?B?WEZhR0o1YkJMc0VDL1JLa3BYdmIxdTNLcDBrQzVMaEdIaUpIRm5oeWh5S21k?=
 =?utf-8?B?bVdXaDJaakdheUhmTHg3T1dQTFBrSWd1NHVYcDdKdVlTb0tRZjRoOENKVlRM?=
 =?utf-8?B?ajNCM3Nmd1ZQS3NIS09FaDRvTy84TlNhVTZQL2FhUVhQcjl3bUNEYkhycjUw?=
 =?utf-8?Q?yWViH9LznYkreGxpY29TVFUq2PHQEI2gUYZkZ?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 153b7a2e-59a7-4af2-1a21-08de5e75da87
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:02:20.5188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRefmzc17EEUCDlb5J24FNiSwc3XZTlTdjFmXsYjLPkJy6eDjQMIQm9SFVpvIg4uNud7HE762W4nDmjMG9tO5xsxyxtfvLzSLsi/4PE8sZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8767

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

