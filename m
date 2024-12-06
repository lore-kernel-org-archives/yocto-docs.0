Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB27E77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 13:56:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web11.37121.1733493406554087878
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 05:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cfN9+qKT;
 spf=pass (domain: cherry.de, ip: 40.107.20.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRy7d1QF8/RszrLxdO/hLDt+7+WbIXqde8ttCCY/i6z5maRp+a/wu+k9+7FBhmRjK8NNNadcG2CHbgGx4HniSTwWa4/j6TcNQUlG79J1StRWpjq7bduPcwM2RnADxV17hHKILV66+hiHPDQRCp7sGeu+QYSWSHnsqxkEajp94EFV2k2AkE1v36tkM6eFehpS1nP8UrlwXAvfcvOz9pVOmWe0YiRtSQvVs49PlFR3NPPFHoGIsrMBKxom+iuBvB8SpY1vbYUE0xFpMUDleVNsDQBQo7k0aL1ah9nHEFUwvvDJiQsZYQQR3mmauSkb6TTh2gENZ+dl1vEApmQpxM6yXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tI7aNp2nziOb1Ood0Cf0x7rQOMbrOivpPO7gPmKgTLY=;
 b=A97ptCf73szccvCk+YSX6omM82PsOqz/1SJENlJWlqbNtEEWKO5vfgwB/cAjBk5Rs9b5PwLW+yVuta+fUJyaz+/g5DEnTlJgzD+K2ttIY3POoffHfVNzu1QLPHdfbgZDth9LKX9uHoCtGuypnYGJH82U1BVXgeZqSeWvKWJHtUgU22cMmQx7SEuzhKdA31k6qUdfyWJYmbdvvvQnNskm8B3RtNc5hBbIlDuiyIzl1jJzNELFcqCfxcFpgqL7zeQBYSgUpn5Pc2u+DPa84+LxvZoUKiUnC2nqzPd75oIGhGYc36QfOX6hum4cHR3ixa6Ga04uEa50CF6jhRC6iXI6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tI7aNp2nziOb1Ood0Cf0x7rQOMbrOivpPO7gPmKgTLY=;
 b=cfN9+qKT3RnnE9krsTaGOqmLCuoyrKYu5kAZfKVwD6QPetrwlhFRnA4ZlUnm5RlfY/aoPYoGc/N4Nco5pXUg2l0x4L3kR4U85b2V4GbIPJVLip/YnFesLbxsqLsT95zaxIy+W01DsRGc6EjdqbeQPSkvA5gpiEDIMM9Ysv0Ny8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB10988.eurprd04.prod.outlook.com (2603:10a6:102:48f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 13:56:43 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 13:56:43 +0000
Message-ID: <0fc67e83-4c38-4274-bb38-905f0db1a4d1@cherry.de>
Date: Fri, 6 Dec 2024 14:56:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2 2/6] poky.yaml.in: replace inkscape
 dependency by librsvg2-bin
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-2-1d9b4063476f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241204-update-doc-deps-v2-2-1d9b4063476f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0443.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::17) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB10988:EE_
X-MS-Office365-Filtering-Correlation-Id: b24d0c9e-35fa-4818-0a18-08dd15fdd112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WFM4MktzbkJIMURhZkxiY3cremk4U05LK21rM0JXRFh5Wk0xQUdHTm5FNDNs?=
 =?utf-8?B?emI5N0QvMzRqSEFObklzTnRyNTJsQytDWjFKRkNRVHhGQk1xbmZBTmJtUjBP?=
 =?utf-8?B?WHdLc0p0aklDYmZhV1U5eTZYWllLN1NIcEtQSUNtRUVrbEIvc0t6T1NhZ2Ir?=
 =?utf-8?B?eExhbWZKUGhxWDB5LzZkOWNoaFcrWGhJakhoQ3ExVm4rUlYzVnZmMVl3NXBo?=
 =?utf-8?B?Z0ZxU2RrS24xQnl5RW14WTVRMUFWQkxicHhacktIdzJETFdGTG0zWnNRTWox?=
 =?utf-8?B?Q2lteWtIT0kxU0Vkb1d1WlpQM1Z0VXhoRHozUm1TQ1pEdDZRTlNoandtQjY4?=
 =?utf-8?B?LytxbzBQMkorc1VjcnBaR1YxeWphRHllMzdvWVJXUXhjZGJPdlV2YkFXYVJ1?=
 =?utf-8?B?WUdlKzFxK3E3Mm1jN1VUQ0sxbkJCMkxJQUxodzgwRWphOXdpNFVmTTdmS3VJ?=
 =?utf-8?B?UDJPQ0dlYkVDQzhSd0E1V3NNNkZ6Z3dxYkY4MEY1OERTaXZZaEN0QzhRU1Uv?=
 =?utf-8?B?c2I5N1d6akthSzg3VEYzaDNOVlFSVDRwUnU5bHQzcTRvYmQxR2JUdlpRak1T?=
 =?utf-8?B?RzAyYlhybjVWZjJJMXMrVzcxdEFYSG9GbkxLN1ZJeU5pNU5tcjA5enZldDI0?=
 =?utf-8?B?RlJES0hZNHZHSXhTa2lBVlhUdEVOUDhiR0UwNXpKNy9OYVd3TXZuTWZqTkR3?=
 =?utf-8?B?M0lORER3VTQzUEl6aHA1WFNldnJ4RFg5T1Z3MGZzejI4dEtpbjJ6MS91RGV6?=
 =?utf-8?B?NmJDZVcweGovUGNlK1plMkJZOE1EY3NFbUI2eGQ3VS9PU2RkMUJkVm03MXVi?=
 =?utf-8?B?blBMT0RZOU45dXlnMU5SOHRTUi9WTzFZcnRkM3QyelI0bkU0Q0pNVzZsbFpm?=
 =?utf-8?B?bUtjZ3NWeC9VT0JraGdRVVRwWUt1QzcwYzZqSVVVa29IaDdsd3I2dVFOK1lL?=
 =?utf-8?B?TVdrYWVCQ2hUeG1SRFdWcUNyVmV2bUVpQ1FZY1ZNTGxNbXc4VUFnaHhZdWh5?=
 =?utf-8?B?OGdmakdFY0dUUWV6WXhnQ29LODQwL2hRc29IalFLUkd0SjdwRFdCZ2Ywc3d6?=
 =?utf-8?B?MSsrdzBBTDY0dkRza0NNbjYzczdqM2Fna3h3azM2YWh5am05RkV6WFRabk5Y?=
 =?utf-8?B?RU5TY2pRcjZxeWVBd25vNnZ1K3Q4RGtRb1BheXJlelFQWW00TW1ob0ZBT0VF?=
 =?utf-8?B?MUJCa3hWaFp2U3FKNWZuZ1ltL1hTbW00d00xeFZ0S1hDRzhaVXVObStha2I4?=
 =?utf-8?B?a3FYRE9KS200MW10RXV0YmhMOUJZeXExa1Z1b1pwQ0ZLUDJnZnU4eXlERHE1?=
 =?utf-8?B?VzE4cWo1Y29ya0dWVlhVaFBPTUgzeVN0VVh3bCtCSituaFJvalFBRHJRMFhj?=
 =?utf-8?B?M3RiSUVkQTc2dDltcU5JeUVSbHBJWWtNTlo3OG1MdkN3VW54L3E2d2I0UXMr?=
 =?utf-8?B?aFQrWEYxSmFlSjJJdEY2c0d0V2tyMnd2bEdSN2V4MzA2SjBjRkljWHk0MmZa?=
 =?utf-8?B?L0ZSSzA1a3NoK1BTaS9VR2tOUUVXenIxRjdWOU53YU1ubEY0dzV1NkNSc0tr?=
 =?utf-8?B?a3U0N1RKK1c5MGtWemVPeGZOOTNWbXdjbW5kQWx3ODZnR0tYdWZwdlJWOXkx?=
 =?utf-8?B?TlRuTXE2L1BHZllXOGNXb05rcWkyMVNZYzhTck91RjNqWFNkb1FCcldnRGRM?=
 =?utf-8?B?ZVdkRTFKUDdvNytkMUNIVzJ5di9zaGJDcTV0TmRFY3BFeXoyQ0V6eVJyVlRC?=
 =?utf-8?B?dHVOQ09QM2FnNFg5d0JaWklqbDR1MUg4aGxaUERXbjVSNktxdHB5SHBoZXBx?=
 =?utf-8?B?VGVicGhQMkhKT3R0ZEdwQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHhZREU0RUJickVaK0R5dUREdjE1WFlTNEFXS1JpN3hKeTA4NjFTNEF3UkF5?=
 =?utf-8?B?OWFuM0Z1R0xOcDU5Z3dHbmdCQlNRZGEvamsyeHhoTHpDVU1rcDZYYVR3RnZt?=
 =?utf-8?B?cmJUQUZocEJKVDBCNlhhNDl5VTI5RVZ6b1p4M3U3VGtkR01lWWRudnd4OC9w?=
 =?utf-8?B?bFNHUkYxVlB6SVNOWEYrU3VJK0xOdXBPTERnUFZSalNiTlFCYzBObHpBb05G?=
 =?utf-8?B?VGtVM2tYQ2xLVWpEeSthWWpJTFFmVlpWME8zMFdhWERRRGRxb0xoWjB6cXh0?=
 =?utf-8?B?OUhGZkZiRTlUSkVBWHAzZm4rdjB3empoeXpPVE83aXJIYUJWMGVLKzVmcUZa?=
 =?utf-8?B?SlhYOVVBOHdld3NWWEphTndITW9sZ05VSlF5MGxxbEYzNnAwbU84Y0ZqWlp2?=
 =?utf-8?B?c1hHbThLdk9SQ1dSdFhGWWhDVnV5MHZtMEJ1Z2svOEhpdXN6WnN0Q2JoRDhs?=
 =?utf-8?B?MjVLMGdYMnFvUVhFRjl2ZjRCU2dKUWZxVmJDaUNIbnRXajE0cUdSYlM3VkVv?=
 =?utf-8?B?TVFSV2ViQlkzY3B5Z2tSdldFdmNXbC95NTNIbGNmZW0wMFVMM3RXaGk1NjV1?=
 =?utf-8?B?cXVkU0ptajE2T2FXbmdmb0lpUDNCSjlmb2pkOWFidWdCTmpYWnlqZjlrMmU2?=
 =?utf-8?B?a3ZjUlBob1g0M3JSZXpLTm1ETnExSDROY1ZxVFR3cXhpWEV0SkJiSWVISGVG?=
 =?utf-8?B?ZERmMUxjUFBZdHI4RW9lYUpIZisxZlFkNUhzTGpUeTBoTG5rSEREb2JndzhY?=
 =?utf-8?B?blQ0Q3RzNnB1NFN2S0Q5Ry9XRWpOU1RaOVd5MGhEbjFlZENGMzU0VVBpWkpT?=
 =?utf-8?B?UFRkR3lTdExIYWlwVGlKaUp3R01hekJOcHY0QVVWeXpQNmY0R0hEdnNUQ2w2?=
 =?utf-8?B?cW9uaVJiUXZDWS9EYTNEU2s5VVQrZTZGcUhjclFMaXVrT2xSYXdlMW1acVcv?=
 =?utf-8?B?WFRJNU5SVy9oSkNPVWM0K3gvZy9HS3hqb3pMcjNCc0FZVEVoVnFqcEpCY2hV?=
 =?utf-8?B?NC9XUFlrdzFnTGhsY2U5dlFTdm9YM1RVelRyODM3QU0ya0lMSWNKRWxZL0pI?=
 =?utf-8?B?MGdNd3dGYkZicEJqeGtyMzdSd1VKWXF3SnZhd1FSUEJ3bmRvS2M2YzU2eFFI?=
 =?utf-8?B?cG5RYUlITDZwZUxYcnZiWGl6cDZhMWVLNFVDRzZKNlpTMlNKbTVpdFFYT0lF?=
 =?utf-8?B?MDhOSllNMTNrRnBrYmNNbGxpL21tcnpacDJWZlVnSmlaZ0g2aGl6OCswUUpi?=
 =?utf-8?B?Qmo1eG1seTVVKy9meUM0R1hNcHNHazc1cHNMUGJ2cXI0Z2xBMHdQMDd3RVBh?=
 =?utf-8?B?NFJJSkJrYnZRZUtRK0FtTTY5OWQzQ25ndm9mSSszbTVjU3psa0N5a0pja3kw?=
 =?utf-8?B?dUptdDNWSTlJM1EzeTdGUmd2NjVUZTQ5V0JpQ1NNMWU4Uy96WktVSVR1MExx?=
 =?utf-8?B?eWpUaUZic1pnVFkxNXZCczNYOW5LcGNpQ1BocEtGak1taTVoSG9NcEk2ZEha?=
 =?utf-8?B?WGZOTnVSYXVCdnQxQmI4SXVZNWRYcDB2cm5NQ0ZyZUE3cGNZUHAyY3ViRGZu?=
 =?utf-8?B?L2VoYVdSdll2TW1hdlZYdmtGMjVMemg1NU4wVk5WNG9BMngzWTFISU5IRVpp?=
 =?utf-8?B?UnBhcWVEb0FyUHhlV1RsQjNRd1JZb0FVb2ZYUlBoMkZad1ZVL3E3Y2hRSTJu?=
 =?utf-8?B?R1Qrc00rSXp0UmNKYWUxU2lOWkpOT21XVUJDM0JWM2tEQzBEQjNuR1VWSFA5?=
 =?utf-8?B?WVRmdVdvSG95cSs2d0xkSjlyMkoxbC8vTXJTNGpTMjk0MjBWOVNMbzJ1bDln?=
 =?utf-8?B?cVZOWFVGMVBaNjcwVHhYYnJLcDNJVGhKVzJIZmZqbXkreldYV0VqUm5taCt1?=
 =?utf-8?B?YlNwKyt0SytSSk9SMXhJN214LzJ3UWY2UXFUSTQ3TFh4c2hsYVRlS2dWamVJ?=
 =?utf-8?B?bzZKcWhZdmppMWd6UkZ1NDhTTTZiTDR3TVlMT3dPR0luNWdtMFZTMHBLSG9l?=
 =?utf-8?B?dWtaMVhDQk96d3poYUt0TUJlc0p0bGZJMDk4OWNjdTZBVlF2cEd5N1dsVEd0?=
 =?utf-8?B?VXJMZVh2akcwOW9ERWxIWUkvdTZ6cDhqWUdnNDZoWmM3Q3BJYUF3OHh5Z1hJ?=
 =?utf-8?B?NW5UV095V2hSdXh0cFUrUEJBVERDS0VXY3J0b2oxRmJGRnAxd0tHcGhaWnlP?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b24d0c9e-35fa-4818-0a18-08dd15fdd112
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 13:56:43.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug/C59ii5t5KLSv+yf/e8zar1sIKzEdMrl+YJaePOIpPQ9dt9KoiKGTBJo7uW07AhbVXtk4FJl4baF2zrh7HcUU/0/NLnIB8fGShl/vB4tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10988
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Dec 2024 13:56:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5891

Hi Antonin,

On 12/4/24 1:23 PM, Antonin Godard wrote:
> inkscape used to be a requirement to convert SVG images to PNGs/PDFs,
> but we replaced it recently by rsvg-convert.
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

I would recommend to order the commits differently.

I believe patch 1/6 and 6/6 can be backported to earlier releases. But 
by having 2/6 modify the same part of the code, it is possible that 6/6 
won't cleanly apply when backporting. If we were to reorder the patches 
and have 6/6 before 2/6, this should not happen.

It's anyway you that would experience the pain of backporting and 
resolving conflicts, if there's any, so up to you :)

Cheers,
Quentin

