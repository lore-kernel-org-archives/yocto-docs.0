Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E121C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:49:05 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33521.1782722937607464124
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=U86/KQdT;
 spf=pass (domain: cherry.de, ip: 52.101.66.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqDf1oyoNk7MpMn5pQxnJaHiAIU1bRFb5/iVN4x8nwMaJq+D5m0uA77/AxsWJPYBKkV9oA9FMF9WCkZPZQJvainiHjaUtstlkbEhNhrsmoOqRhHUGgM/3KtPXuW13N6fNKWoQzK5WWfWjxvU21D7Pv4HSq8eqp4JE8frcn72csX9gzkMKJJjutpXbZMBmK1rVX3qoD5cdUZpj3DF/uEhYrbfeeWJ8Ejg3kr7OXzQsC/fE0Lcgncy+lZrB84BO/5hVWtMmSpvjNUxTg0T2mBDXlvGcx3/AMcDRSMLSqpNu4sf9icEeNcIS/Q+eOmpDn8EzEsvtXQet2Z7RPScf6kX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1U19gOSX4fmDgWnATl7he8lYeOgrG3aut/dyp8xIVs=;
 b=hxLuqjypx34LvUle7/svwq9bdfjtV5hZQiIAfZIzbuV9wnnwIEsZV9eCeBm5EauuKOk1NxIzAfL2Xege6VdWri/1KmjNvQE8PbGPxJ8xqjxMshZ43qVe7cRdggI+tIaM6kLNqvnn7JW5s9MDpnJePjJVDc1lBwki/39003QMlVncBTGdWUHbs9CCZzpvVmpUYkHDENbMeaCAzm8Yqwq3qreA++oA69mOIyHCOfH2ZxGkuqdpewP7E58MqzfQQ3GujifrHqAFjQdfIOzkkGSkjoZ6jEvcnW92gaQQn0xtXodIbwaXpmLxrIIfxCqiEGT+9wNJuNVU3jn4N9P+LTeCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1U19gOSX4fmDgWnATl7he8lYeOgrG3aut/dyp8xIVs=;
 b=U86/KQdTp7TVM3bMJhc7cvZQS2bmDSQyihpuchW0VH54d/M4fkoMGwgJtvhSqE9J1Uaav7dl+WhReEd8MycVP/cXWszO30rB4p6iBkhK9wOiECze7hqg49A9hKibYCE+Kdmq1nk9YhJD2nb4cq79ndUgVEGQJg+EAFWjtTyI9J4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:48:53 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:48:53 +0000
Message-ID: <c7cfe7ed-c24c-4f9c-8509-79b6bd2cdade@cherry.de>
Date: Mon, 29 Jun 2026 10:48:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] YP docs should use more sphinx admonitions
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <dc561150-2037-1134-871a-d4ed84b28dd1@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <dc561150-2037-1134-871a-d4ed84b28dd1@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIUP296CA0133.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::6) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 19407df3-118e-4bf9-0e21-08ded5bb3f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|5023799004|11063799006|4133799003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	tOawNciMY+amtDek7ApAB4rVg0BvXVo+24QfdHwaN+ESXCriQFR6WOAeojwg0uyUF0VQQu7GuHRMMq3R0UVOIlTyqaGx2t4iQa9IbqOoehNIzZvL+SfCQVon1BvmD6jUP+p6JADnIfBbpqUdM7l+5mcJKeCsN+gwRB+jXzspctCRgfE9er8B6zIlqpMAud9F36CZ9uQ6WWEgV1+WITOIPABSHIks6geT+zTjRmQ4NaBANM7G78r54Ht6RiH0QUVCw2AA8Jwhcb+renhSawbzTjKEYSbZI3IeenYzrGVsskfI8utUjgP9rf1J8iQ0Uyeprp/LD7VmdhwfSbM+XUU9+ATOcFY/szlnHWMKEVww+oHQ8ktfKpoer+MtDVm367nbPJvgm1sw+ZIDSYESykMhwGWYS9wQnNDHjSo6kfE3+vr6vv0zLhaN3UoKzYQMPks9F/VIsAhzmKisQUya/A6OOcv9uFCZbiJHh0lWZGFGRSOmwMEsT9JOlTfRELsmNK2ZH09bQHed1JEHf8P9f7bdrarX2/7d5HlcS4lKLFs/sAkImp28KlktqS6gB2qS5IIOGWCu9v1qgfl0UOXiPXd48m8/8Bd3s2PASUgr6g332Sc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(5023799004)(11063799006)(4133799003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzlEdUFhbTdzbk1OWVFCU0JvWHhlN3B4YTFmZzlRdHphZFU2UkhUdDJ6ZUJK?=
 =?utf-8?B?NVVCR3dxMTIwY0x3V3p4K2V2WUd4aXFFTnViVU9BdVpwZmh6cVVFdWlrZjJT?=
 =?utf-8?B?WVpLeCtQbWZqVXF4T3dRNG9qckw1UkFnYnRDTzVRV3R1V0hQVVQyRU05R2l3?=
 =?utf-8?B?ZXZCYlNJQmNlT2dXWDZJckhUYXNITEQzYmJoWTFxRTE3cm9DMG0yMTZ3UWJI?=
 =?utf-8?B?NmRMWndGMVI1R2hraXpHMVMwWFZjMTNXSHd6VkpwTjZ5dC9xZ09NWFQ4L0ow?=
 =?utf-8?B?Yk91L2RFMS8xRVlQb1Y3alZZaHA0VCtGSW5EQzBsL2lZVHJmQ2RiQ1B4V1FH?=
 =?utf-8?B?Zm16QWloTG1QWHk2V3ByNHFxZStFZlNDSkxJYnFscFI2NndnUkx3SW1XYmox?=
 =?utf-8?B?TVd0WFVuS254Z2JTL3JQeW9mKytZNnZxZUV6UEI1RXRZNTJZQUt2eWUzTlN6?=
 =?utf-8?B?UkdVbnNnQlJQN0YwS0d0V29FNERIMS9vZ01wSVdWMmkwVU9sbkJNMnlEWm5a?=
 =?utf-8?B?RU1nVmJkVE00ZkV4T2FhaXhaL1pGRW9mdWtvZ3lEK1Yram1jc0tOQzVQOXBz?=
 =?utf-8?B?TFBDcTVJUXRDNzJWUmVNZVVIb2hBa0o2THBCZnIwWEJJQk1rN1V4OWtiWUhp?=
 =?utf-8?B?aHhyK1BMcjZzNUVmK0F5WS9Ucnl2aUdxaHk2RVZyL1AwQitRWDY3Zll1QmNl?=
 =?utf-8?B?ZGl0N1c3NkdpcExhQldpNE5HWjQ0czZVeHFPU015cUxmemtQNC8vaTZKREZh?=
 =?utf-8?B?dHZyVFBEV1BhY09JdmpWTmVvbndWQklvSzFQeUNyYkp2SVZ6Y3I5WTliM0dp?=
 =?utf-8?B?UXZlZ092b0hMd3h6bmh3a1ZxWHRjNmJ2Rk1hL0dlR0QzOVhncXlxZGNMbE8w?=
 =?utf-8?B?SitwcEhyWXB3L3Z2VjhHZUt4VUwxam5ubHNWQVZtaWc3TUE4WTZXYlFZenIw?=
 =?utf-8?B?Ylp6aE1uaEFvMi9lbjErL0xaQkhuVFJXVlQ0Yk1HM3doemFjSSt0T2dXTFRl?=
 =?utf-8?B?VVJVMEJzaTRQdkhHelczeWwrdHFXVGQ4cnJvb0J4VXNqeVpCOUVMbzVCdTlB?=
 =?utf-8?B?d3VxSWgya2poRFh2S2w0M3B3OWlHK3R5K21HcVJwL1ZEcFZvSG0xeGZXRVY0?=
 =?utf-8?B?VGpWa1VTZ1hRQkFNUTdncXRocHRXTWFrajJMWDZTemo1VktuTWR2REdyRFJK?=
 =?utf-8?B?LzF3NlRKenljVmpwUG1lSW9lbkROVkxqeHc1OU8xTWc3VG1OcFZXL2xSUUEz?=
 =?utf-8?B?UjF4a3hDRWVpL0pkVWNhY2lRaFAvejRYdmI3bExaY3VxUmQ4bHQ4eCtYSHlC?=
 =?utf-8?B?dDlEK3dGQTQ1SjI5SjFmTHg2UTlrdkZ2UDNYREdXWEFZa0xXSS9VZWJwWUhV?=
 =?utf-8?B?Y284RzlFdmNJRXBQR2hYV3ptT3FjcUpIa2s0UVUvTUh3UmpZNjMrdUVUNjdO?=
 =?utf-8?B?dTg0ZjhVTUF4STU5cXpKZlc5OE5QUU1WSkJQQlBRTnkvV0xadDl6YnQxaFd1?=
 =?utf-8?B?elpqemNucFM0ZGMyRE80WUg2MWpETS9ZSHh6SDFFV2lOY0hnNmFUS0VHTWJa?=
 =?utf-8?B?aTgzL0JYMWQvbVVTa04xNFNiR3h5Qkg5SHFmNUMrM3NuZ2l5eWJRWmw3RW9I?=
 =?utf-8?B?UEdkNlkrdzZ3OGdOcG1wVG45NDlIZHF4NlBzMUlMUGFMZnJkWjdEWEltbVZ1?=
 =?utf-8?B?eUpmeXg2QjQ2eFgwVTBNL0h3KzVnRklwOXlKOEp4aXk5S2lnZjE0UGNwbUZW?=
 =?utf-8?B?elB0RFh3TGw3TVRocDZQb2lLQ2RxZzFPakN1ZDJ1cjV4MTlBTDNPcEFMRjFG?=
 =?utf-8?B?b0JmR2ZMclhEejAyTmtXSm13WUQxKzFOV2QvOHZNWHRvN3JnTm9HQUMvcnV3?=
 =?utf-8?B?SGEvT2p2WVpyc2JhLzVxRkl1OHRDSHFQa1Naa05NYzM3dHpPamNEcUdsSjhJ?=
 =?utf-8?B?ZytZcy8rd0NHV1kyRDdzR1Nmb1FWZ1JGclRmNzROREtnMjk0ZHY4YW91bUdn?=
 =?utf-8?B?czNyTS9TRzZINlQzSVVmVnJYTkFyT3EvempUZFlvWk9JTnRKcE5ZNml4RElR?=
 =?utf-8?B?dGNONkxCOWYyQWFaYzh3ZHJDaTg3Ylk5b1ljU2J6RzU3ZWtlc2d3SllDZFg4?=
 =?utf-8?B?bk5hSnBIVkZwY2xFNWRjNjgzM2loVTRTbHI1cXNBWUEwVWxxZk5OMFFmaGNv?=
 =?utf-8?B?ek5qdUVyejU3MFpCNVJIcjRoTnpkanVFNTBQZUhRZDhMSXAyTUdXVHRWbFg3?=
 =?utf-8?B?ckRVUXArc0Jsb3g3OVF2RDBNNldWdWFCNUhoaVV1QUZoWjFnVU0yYytFcGFL?=
 =?utf-8?B?Y0dISmhUNnNBQXZYVU9qMWN4TWcyTW5RZ1d4aWxIbVIvSmY2ZHg0UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 19407df3-118e-4bf9-0e21-08ded5bb3f43
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 08:48:53.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3icHkazHzCO96z+xumpWjjfWlShj2wK2XnZ9DI7tvryPMNkppYkpgOSTGw9SzpaP91S/repV5jb+STwHatmBqn5mD3kupCU7hK3XsRNCsQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8570
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9965

Hi Robert,

On 6/26/26 10:13 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    while there are *tons* of "note" admonitions in the YP docs, sphinx
> supports a fair number of other admonitions that i think should get
> more use:
> 
> https://sphinx-book-theme.readthedocs.io/en/stable/reference/kitchen-sink/admonitions.html
> 

Please only look at the official Sphinx documentation for things that 
are actually supported without additional Sphinx plugins.

https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#admonitions-messages-and-warnings

It's *very* often looking something up on search engines for something 
related to Sphinx to fall back to some third party plugin. While it's 
not necessarily bad, the fewer plugins we have the best :)

For rST wikipedia says it's https://docutils.sourceforge.io/rst.html.

But I feel like this is a good idea, I like Sphinx admonitions quite a lot.

Cheers,
Quentin

