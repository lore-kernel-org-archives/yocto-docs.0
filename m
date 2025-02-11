Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B487DC021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 10:41:39 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.16])
 by mx.groups.io with SMTP id smtpd.web11.9439.1739270493784288427
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 02:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Drn7QmDH;
 spf=pass (domain: cherry.de, ip: 40.107.162.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL3pF+YlEumFP6WVbeebtxoKQ0SZ/ypjydzvhuEulJBeuPSrtK+BrYrRQcIq/VcbTftYIIiUfzQ+d+J2uZao8FW6FJ0C/WVqfJAJy1R0S3aPm9U4MNFBA3lkcCYzYuuSrOftYI+pyQ7TUYbOE6zFwZuGHYOUYeXv24WEjMFKQGlyQNuD+hJgPSE4OkKA5mbLZm0iUAO64UX6aYjnI7U4HhiP4z40AqlP3mCC9TpeO29tmgOYEmadafn1hFuZqatVBntU/50RCERudT8MlcqAUcLN82yIHlQ+tfhmQE+XQvVCI6mAwNVjgoCb+7+SoxW69h99ZYe8qH3NFMSMyVa9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h/K8LBNnGv35ldnJxH6ha5S66N2w3ZJcjeN+7EX5o8=;
 b=XM8va9w0UMQ5m3th/VGUexAZ+hYnVIZiuG8f9XdBYGziHKgWmMzKUaaVm+YiXL5Xpx4M8WxqosZ83d1gjdKDeQ0d5xoMDaIQ2MaQIcM9cu/eKftC3UWGE8QJpM0UfiWZ7yKz7HF+VfEoUnoWrIJIBDX1BK0/Bv2gke/stOUj5VvMc2MhwSiiyq780/LKwzlcEs1m8AJkY/PWBBzHvu6It52aVjnHNQKbF4r7i2EtLVpsgY/JNXj66JzZpudBeDQdmI7QXbQeP1sY8dINcY2ILj/dv/xm2t69lubJjF5v+vORkczyv5LkcghvkRnX0z2Rs36GZSemyRVM5ktESahGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h/K8LBNnGv35ldnJxH6ha5S66N2w3ZJcjeN+7EX5o8=;
 b=Drn7QmDHAiI+mC8fKWhV39B1lJtxf8PvQeURE/Xg4wmVYpkudZH9/9Bsp6o22bkk3X3bOQQaGQl/spzVf1ivfgmO4f7w/NrEI+lhad3Q1auzchx/xV5pSm3n164u3lYUq9++l4vV0gLSh+GawlcZFwXTAc8MX5JbD//aXpQ8QhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 11 Feb
 2025 10:41:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 10:41:29 +0000
Message-ID: <ea0cf4b5-f7be-4fd7-8e22-7186364b7089@cherry.de>
Date: Tue, 11 Feb 2025 11:41:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/6] dev-manual: move multiconfig documentation to
 its own document
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
 <20250207-multiconfig-doc-v1-1-f63cdab1fad9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250207-multiconfig-doc-v1-1-f63cdab1fad9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:802:2::23) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: 5baff2f8-666f-489f-5745-08dd4a88a443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?THVmcU5oZWV4TVBGSjltMVR5QlJoYll3c2N6ZXRWMm1KZEp6K0hNd0g5T3VL?=
 =?utf-8?B?eVJHY013QWI1cE04RlJTd2lFQXpiaUtyTm5JVmZGc0gxQmJEcnBlWFM5bk16?=
 =?utf-8?B?UzdpazAyTGsvSTZOWTh3ZUxyRlFIZllqRWVWVFlLbUk2NjJoUEtpMVJjNE1p?=
 =?utf-8?B?R0FjRUFyb0wrWTc5YkhmMFVLM0xIZ1QyalBYbk16bnVJNDA4VmpTWng4cTEw?=
 =?utf-8?B?WFQ5ZERFRTV4RXdVd1ZoLzE4Q0VrdXZNeVM1TXhPa0hiS2RXMmdnYTcxNXlT?=
 =?utf-8?B?aWI0Y2FQOEFlRkRWdS9HVDVrZUhUdDFCbk1sZEVFS1d0NlFXZnlDaERIMmxr?=
 =?utf-8?B?cXhzUHB4UEkrYnNGQmtTSXpCcC8wQ1AvU1hsWTN4QWRWWjJHVVBuWXFnMGtJ?=
 =?utf-8?B?T1pjQ1QweXQwU2pGUFRmQm5KZ3F5Ymw1c2padzYyZXYxa24vWWR1ejFQQWJv?=
 =?utf-8?B?ZE5WREZzTzYyb0QwTTJZVzM0WTg0QVhBNVZINlUvcnIzNGNJTi9jMHYrc2FV?=
 =?utf-8?B?R3VINVhxOWYwQXF2d2tBQUN6dlF5SEIrc3RJeTJQUVRyMHpYbjRVWkNGSkdE?=
 =?utf-8?B?NDVleFc0eE05YkVUclMyWVh2U2J5Y3c1eHp6Vlg2VklWd1ZsSndkSVdRSG1M?=
 =?utf-8?B?T3lWUGNpblBxWjlaZjgvaEphM1lBZFp0TzVEdlZrellpMUpoVUZCN203Rklq?=
 =?utf-8?B?OXE3aC9GZStrM0l4cEg1Tm1aTEV0N2FDMEZFWUJ6MEptMUcvZHc4VnVKWkRz?=
 =?utf-8?B?V3V6aWFDd3RBRlZ6Z1BtYzNhT1d5VEhrejRNclhoQ2xBeVltSlR4QU5tWWhT?=
 =?utf-8?B?MTYvV0Y4c05BbVZHaUkyZ1daOHRMdE5tRlFDVldEcTljS0V1aDVBYXoveUNU?=
 =?utf-8?B?S1RiSkZBMXdRZzJtMkFrY09PT2t3c3NpVlpRZ29RN3VjWkFTREQ2dGtVaFRE?=
 =?utf-8?B?cUhqNWcrK3FKditlcGRnYWNGaStmTzZTcHR1L3NrNERpaENxZE1sNm15VHgr?=
 =?utf-8?B?Zkk2YkZOenVyUCs2SjVZdWwyL2pFWEtMSFkveFRtN0tjQ1hWZWlXaDJXc0tn?=
 =?utf-8?B?TkVhRDFqZXg1eFVGVjNiOG92VmlVRzJTOWxQcDQxMjdQZWVIaTlSOHpzWVgx?=
 =?utf-8?B?NGc1VGR4NXFnK3hYWDdFYnRIamlNR2RNWTAzMWxYZVBuMXV6dExUbXZ6QjA3?=
 =?utf-8?B?eVpUR0RXbFRXaEJOM0ZkclROSWxocG10Z0dHN010S0l2YUxNcnNpWXI0cUZi?=
 =?utf-8?B?Q1JSMGlqNDQxZXRVUmRzVE9QQ3NTWCs3MnBZdmVyK0dpVlZMMHJWTnpxSnhl?=
 =?utf-8?B?b1U5cllDQmo2Z3d6NmFNVHJ4M2RQVzB0K2JORldDWTlSWXF6R09PN2xCNktI?=
 =?utf-8?B?bmRuOXZ3Wk9TZzBOY0RVUjlLNVVaN1pMYVZocEVUaUw4Vk9pRHdyend4Sm04?=
 =?utf-8?B?STZLK1lwc3RUbFQ2U2ZKdzNnRHdoU0o5VGFCR0Y5WXFhVy91M1RHZmFEUDJi?=
 =?utf-8?B?Zk1GL0R4Q2tkZ2M4djlDaTUxc0pzbEptMkVzT2o0WjdQZmZiRVp1WUl6cEpE?=
 =?utf-8?B?UTJGMGtsNEpFT1l1VTNlSk5WMnNGVGJnc0VsQzFKaTZ6NFVYSWl6eUViMi9N?=
 =?utf-8?B?ZWt6RGpxVUVBZFpYLytydERlMld4eUw4MWd5bmpRdG9NclI0L0RtOXdOTXdS?=
 =?utf-8?B?N0ppa0pmbUZpeHpjZjN6em5Xb2xlZ1gyR3V0ZDNJbDFHbE52WDVzR2JvRElV?=
 =?utf-8?B?U1hTR013QjY0NVQxU1VIS3B3NDlYQ2xURFBDUFdOQnJTeWpBMFdkdzAxRmdm?=
 =?utf-8?B?UTRxUFM5VXV4NC95Ny8rN05INTdLRitoSHNWam5ER2FwTlpaVC9hOVFLTGVr?=
 =?utf-8?Q?mMYTC+9rtVBkH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dmxqWENIZ2ZVd1piN2ttWnhBZXVDallSNUc0bHk1bmp4REV4aWRBN3FNa0Rq?=
 =?utf-8?B?ZEJRN0FPdU1nZGRnR3RzSGNwNXhqR2poaGxrZXJsTFdZNCtqZmlsMUZFMG4r?=
 =?utf-8?B?Y09xaWd0elBZVVZaaDhWM1E4VE1HQk1acG9id0MrMDlIbE8ra0EwMGw2dGJj?=
 =?utf-8?B?OG1lTE9VSC91S3JCT3Vkd0hWcENtdVNuOE93eDZYUm9UU2ZrTy90bmxCNnhw?=
 =?utf-8?B?RUNkUWc0RXh5RDBPM2R3RXd1ZmxPc2ZDbW43aXhlb1dXYXdxTWI2R3dOVGYy?=
 =?utf-8?B?aGhXdXZpUnh4b0xrWnBVeDZWK2VHZTd5MjB1cURIYzMzT0QxL1hkc1VlWHIx?=
 =?utf-8?B?SXA1Q3JrUHlndDl2QTNZOWU4c3hVWVVQNWRER1hVbERBdkIxMUxSTjQ1cGdy?=
 =?utf-8?B?dFpuaDF2MGFlSXFTRGQrRVBFc3N3eXFSU1EwQVN5WE9HZzB6QnFsQy9JZGRj?=
 =?utf-8?B?QkwzeWVibFpVUWR2aFByRHIxb1JnN3F5LzBSNDZ4QUQ4SUg1MXVvbzBkOGx3?=
 =?utf-8?B?NkI0VGdad1Bpc3BvK0JNdlg4Z2Y5NkhEU2xMd1BWTlFaNnNzK0F5bmd3M1U4?=
 =?utf-8?B?YzR0ZmdLQ0NCQWdzVmIrcjZkbnZGUlNHV0wreCtFN1RtR2ExZjNJWjVYbGE5?=
 =?utf-8?B?eTI2YmY4QlZ1dGFEakFpaXFleGxNVld5MnJ6MTVyYmRhK2ZYNTZOZHRTbDgz?=
 =?utf-8?B?RVBtOEJOTHF6Wis2TDdpdUJPdVVwR1VTYStzTmVsY0s3eHRtQkVXUHBodlJn?=
 =?utf-8?B?QjhvalRmWHJ6emtoMWV2VFVyQ0NzaG1Jcyt4cU13QUluUEZ4ekFPUUJoaDVn?=
 =?utf-8?B?RDRIeGZXTXRrRU1iTXN4Vk51d2p4NVI2RkFyRUhmNXlMZklUUWZXZGtqbWdZ?=
 =?utf-8?B?dWFORzR4T1NOQzNiNzgwZDl0QzFRaHN2VzBXdHJWMTBOL0tNTk9GODRWblVS?=
 =?utf-8?B?WUNvVGxoditzOGpYbG1DTHV5SUR1SXFUS0lFZ3NOZzdzTzBKazc0L2l4RkhB?=
 =?utf-8?B?eFBoL0NjUXNURzZPWGdoK3lRWTl2WVZ6c3ZOMVo3ajJXdktqTk1CVy93NFhS?=
 =?utf-8?B?NUEwdHRGYVhyK3BmSW5qYU5Xc2FLL1lXQXZ1M1JCTTQwcFpIMnl2c2s1RjM3?=
 =?utf-8?B?VkxHajh5QVdBSFE3OEZUdGd2UWZoa0VzZEdXUS9OMmwweUg2TWtER3pyM3Jw?=
 =?utf-8?B?RFNFeUxTYXExTkQxYVJrK1piaVdwRC9RcHZSRmZRd2ZtTUlwY0VNYm1iYXhZ?=
 =?utf-8?B?b3J2WTdaVUQ5SGdKWkNpMXNVU0NFUGVhOGFHd3JHWHpkY2llSmc3ekRWVWhH?=
 =?utf-8?B?b3Fscm9VTHR5T1RqWm1CdldUQk15NnFjR3FvcWM5WFhjV291d0M4cHVvZzBo?=
 =?utf-8?B?aDhhOUNqRVJpYit2M2NZYVZVbUtwcUIzbXlrV1dHeHdyRmtwQ2tGN3ROQWRa?=
 =?utf-8?B?MnQrVEhMRDMyTE4xMnJqSk85VlJQUEJjZVhhUDF0bkgyb1dPL0JQR0YwTHBy?=
 =?utf-8?B?TCtkSVlIUCt5dlRKYWFYRnhBbmhSRnBSUG9pNmFoVTlaOHdYTHF2eFl1Y2N0?=
 =?utf-8?B?RDhuVlpqWGY3YnM1cUpaUmE2YUNKcStWNFFycStkVExzUFp5N20wbWRleHJO?=
 =?utf-8?B?VzBLRCt2ZjRXV1RGcm1xeVV2bStYdTV4cDNmazVlbTZUZGFwdG1XOWtuM1Zi?=
 =?utf-8?B?RTAzYW5BWlZKblNLRWRRYkFEYll4Q2JDdzlHTittMjdrUitZWmYyQ2FGQmN1?=
 =?utf-8?B?NmU1L3ArL3hrYXVtcURJbkJRUTMwS3BiR1c4N1RZMHRSendENDd0NEx2VzNK?=
 =?utf-8?B?ZUR3VGNKYWh6N0NLenQxUmRnVG90RXRod1pwNjJuLys1MXozRFh5NWJoNGJp?=
 =?utf-8?B?Q0RhRUFqVWNnNlZOUUNoakltejA1SmU3MTBZQ213Q012dTh6MFd1eE44OVpX?=
 =?utf-8?B?YWdOOEU5alFlOFZPdXpaSjlkTTBpYzdKQ3VuUDVXMGFNcWFhdzBmNGp1WC92?=
 =?utf-8?B?QzRyYTliMTE2Y3VWTi94WGZ4cVgwcWI1eTljaEVkekFZU3JyT1pMV0N2eS9u?=
 =?utf-8?B?K3hwaUlaL3ZhbzBkbU56YXRpNk1wQ2RkTXU5dWFuMTkxb2FQNk9zQjdRWVB4?=
 =?utf-8?B?TlpZTzNWS3BvNUVoWHhiYmx0NVRNdzdkK25aL2xiaUgzTXIrMWNiczNMUHFs?=
 =?utf-8?Q?tISnmxj9lLMpmYH/ElwYGcE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5baff2f8-666f-489f-5745-08dd4a88a443
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 10:41:29.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ex/M6rTU6MvKekxarP3REWFeVInkPFQFKI1nkFJL2/plDQd0p5Uv+jfUEH9AaAkzWWqvG1ZSJaYGqqdaT0hzSk/DYu2WyNU0QLU3fJuBj1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9251
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 10:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6328

Hi Antonin,

On 2/7/25 5:28 PM, Antonin Godard via lists.yoctoproject.org wrote:
> In preparation of more section and examples to multiconfig, move the
> section about it in building.rst into its own document.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

