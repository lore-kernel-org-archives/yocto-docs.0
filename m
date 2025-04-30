Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8937C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 10:16:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.40])
 by mx.groups.io with SMTP id smtpd.web10.13369.1746008211963092211
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Apr 2025 03:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bHUpOJw+;
 spf=pass (domain: cherry.de, ip: 40.107.22.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykB5KFzGBf6hapF9e8Zt+VR/gwAl/VEeRe/ONFlmrnc5y554+/H/oBx2J0OOLlRCoUuZ6URWe6Pg89zzokSRANX4D0acQ3Wl3NzxUve5QW71Q33LQ2m2rca6rjDsgRBZF7R1BL61hsookB+dUZxA4T0vBzhmr930lVW8DjlhZjeKElYnKhjU7kKT/M/xzeV5sX3E1BGrI0jB0WWc4isBxKaiKQ8imFSqQLare7xLdwIieep5GU1HZupg3QLXagPp/ttMpkKFbhLigt9giG1vIVYbbs7o6wNfFe9xIgMbPjtE8LQ2E7rT4VngBFQO0RLeYPw+/SoFLTCfPJJQ/JC2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MG5yJt5XALuQIJmhrHAeg9xEJ/sJYy+Vz6yLaAQ89Vo=;
 b=RfmYptU+t+60GjdN0Gtg7PX16z3ztktEGfhyZKxQ55wwEoTwhTAcAxpG50CjnBJpDqXUnxZ3EV3j6OoEBUFOLpvSYZhgK+h4LqLailhYfylXwcb1wrijt4RDpsoy9iFaf/8Jm1TnIxgdXRZos1/UBYzgeXaK+t0SbQnSg4Jw1OsO7SZnhnS/kzMpMlPW16vnGl4L9r2mzM5h4ZdMtgMaVzerme+RG/zVINf7uuPX74HYLuHN33JZ3724GUpJfzs8Q+bdOVuvoom704ZPfwOXoR8D/QPLksNwD9U+36NqJW32Ul+BX5JyBErHKW1PV7qVmwvoZViYx2B4QbWKY9WcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG5yJt5XALuQIJmhrHAeg9xEJ/sJYy+Vz6yLaAQ89Vo=;
 b=bHUpOJw+cHh5ETQ9hFaVzVUH5skxohwdkKPT6pUKiKH4Vg9sF4zuWKE2LV+XBYjK4s8887967J8drWXiE/QEoQjnckvrx0E1jZYCp+6mz0W/NrFE6YVikRHximK3+GieDZTcsV7ezwLIzvVeAvHLvO+tgAEfCCKOcupauzXVHgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10613.eurprd04.prod.outlook.com (2603:10a6:800:25f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 10:16:45 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 10:16:44 +0000
Message-ID: <1b7540a3-baab-4a1f-8c07-047619127777@cherry.de>
Date: Wed, 30 Apr 2025 12:16:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: kernel-fitimage.bbclass does not use
 SPL_SIGN_KEYNAME
To: adrian.freihofer@siemens.com, docs@lists.yoctoproject.org
References: <20250428201243.596148-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250428201243.596148-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10613:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2a398a-cfa0-47e4-4be2-08dd87d01b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFU5VDEvUTlPRXZoZ0FodDRSZ1ZDT3pLaFhMc0dCRjJxdzlTR1lDR1Z2VUlB?=
 =?utf-8?B?TEFiNE0rL1p4VmxIQ3c2Q0RaYWlCbHQ2SzNzTTNrdGxoQkxuLy9uUURNWURT?=
 =?utf-8?B?SnI4UUdaVTI2K2JBN09TTXNuaGJHTlZMNm12SCtYbDhQTURuSTdrTTJDb3dx?=
 =?utf-8?B?KzVVamFlZ0M5cjhBY1haeDJFWjdnaUJCRmhCZEszVUYxYUZpeHNlMXZtMUsy?=
 =?utf-8?B?SDc0UUFkVVVGZGJTOHNROXhuNXZZRXQ4TG9pdVFZMWhqKzlBL2RyQ1dJOWtT?=
 =?utf-8?B?K3VSYzBDOXJnZnp6cjJVS0wvVG1uZWhWZ1Joa2lvRGxkTUl5VEJ4WGd1M3RJ?=
 =?utf-8?B?N3lNYXdOY2hWeGJKZit2ZUhjRnpNbVFrVzlJUFA1aFBpNzVKWHhZR3BqVVNV?=
 =?utf-8?B?RzMzWmRxUnBGcFBXV1V3OTM5QzYwaE93OGJscHBRRkhOdWM4d1dvazhzM3pq?=
 =?utf-8?B?NGxVcVhsa2lyeEFPRVhVemZFbmR4di81ZzZjRGkvNzQyTGpxeG90bHZJTkVS?=
 =?utf-8?B?RXVBMzV2blJBV1kxaTJNVGg2QytqYUkzaWxiV2tZWEJYKzFzYUlvREN5VlJG?=
 =?utf-8?B?T081WUxJb1ViRytaQzVlRFJVTVNJcEdhbklub2dpTEJJTUxsS3p2OFhIbk9R?=
 =?utf-8?B?MDQzVU92VWVHcUF1anFzVkx3Ry9uRGVVaTgzeEpPZ1NxcTJnTHM3TkZpcndt?=
 =?utf-8?B?WDdHUFpDL2VnRStYN2tjVjAxUldEdE1RMkMyN3lhV0lsTDJtUzlpZGpHS3gr?=
 =?utf-8?B?YmZWU0xSKzVhSnN6WThqOVVTTmpZSjV3YjZ5TWQ1U0EzVWljVzV2dTBpdVFH?=
 =?utf-8?B?Y2lzNlZtb0hzVUJCV1ZGMFZzeHZLSjIzZHhLQXJmM1pac3RFVS9wbzhPemFL?=
 =?utf-8?B?bGVIMi8wK2RYWHFvME1LTlAzdGdEUC9Pb2x1c2w0MnB4MkFHcVBlUWRSUWRj?=
 =?utf-8?B?ZG9wNWw4VS9SNFhCeHZxZHc2VE9VR0ZObTgzYU4rWFZhRHVidklFMTFuYm01?=
 =?utf-8?B?UnhrRjk4UEhid0Qzb0lFK25lVjhJQlpBU1o1S0RZZjd3akRvYmcwbWJ1ZWx5?=
 =?utf-8?B?a0ozbVU2WEExV3RCdzFIQWFaSFpuRFNYWFhXMTlFaWRvOEN0ZXRUREJCMm93?=
 =?utf-8?B?RzBobHM2eXZwVG55VUlpVmdLdmlTTnVtRkYzQjN0TjlrUjNQR0JZcDkyUVpt?=
 =?utf-8?B?L2VxeitoRmxYc0YrT1pINDdnY2dqc3hwQ2RlUFFZZlI2N0NxcFlVVFBQZTJ1?=
 =?utf-8?B?djU0c0NIT1VRTUJOUlQ3MFBGVnNDMVpqS2lycW54cDFtZEU0UDRrRFM1TmU5?=
 =?utf-8?B?V3F3NVp1ZjZYQ2lJbS9EMDM0MDNZdWx3VTE0N1UwVEZuK09oNEpFNDhXU2U4?=
 =?utf-8?B?bTd6dW54c2Vtbk50NUlnWXRpN3ZmUDY2dDBCU0lqdWlQUE01eGo0TlNzT0xJ?=
 =?utf-8?B?UUpKbkhhcWl0SkdYL3BGdENMWTJRcEM2c09uZEp2SHNuUVR3MS9MZFdzdW9P?=
 =?utf-8?B?WmVzczUyNmt5emJtdERJZ0ZTUW5wMGxEc3FXbVFqei9ySXhXZkdJY3NpZ2JK?=
 =?utf-8?B?UzduSkJWbW9nVGpGeFN3ZWdEUXJ1aitLN3phOVB1UFNNRC9hNkRTTnFzSnNw?=
 =?utf-8?B?VmgzSFgzYkk4bmhZQ05RRjBySy9yNlNlbDdUNEJSelhEb3JQclpFV2VISHdQ?=
 =?utf-8?B?Nkl0THIvL0paQ2s3MU1lQmc3cjJrWFhERWJIMzVXTDQvUDltekIvdUlmMVkw?=
 =?utf-8?B?eEhnUmZEcjhabUV3N21Kbi9BM0NXMTh0NkhabytKNytkYS9taWVqdXg0QzNL?=
 =?utf-8?B?N0pJWmhUbDNPYU1QR1JJSndEOWlrV1FHZUwwTzZZWDlYSGxicHVKV2xXQU8w?=
 =?utf-8?B?WG9FZE9wekpMb0dpNTNUeEEyYjRWdjIwdnkxRDJuNklyRXRUSEFTL3dCKzZ2?=
 =?utf-8?Q?j95tyzJE+mA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWxXT1QzWmR6ZXJxcy8vVVFsbFFqcTVtQTExYTJIT1lQTHhpVzhQbFluZVNj?=
 =?utf-8?B?OWZhTFhsZ3U3SnI5Wjc2SllGV0NrekZtTmFFYzU3ckdiejZUTUVIQXZxQ01I?=
 =?utf-8?B?UlJMK2x0SDQ4bXFMd3RxTTREZk1kSVJmUHdjZlIyTW5xbS95a0RsOXl4K1g1?=
 =?utf-8?B?bGNrK0VDSGcxMm9ZTDB4aXRMR0M5VTUzWm5CN2FsMEJxaTArZlFXaWdxSHpB?=
 =?utf-8?B?UGpPNXVCdkgzNkhEYXpEd3Rpam0yWEZNZ09qT1A1aHRwMjFlK2V4QmJUODln?=
 =?utf-8?B?T2twbitLNG1GK2hDTUxTUTcrK0w0OGxyTGdndGl2QXlqZEVyMGIxN3ZoNUJW?=
 =?utf-8?B?NWc1cTBlTUx6UlloWHVGL3FRWlF3SEk5Y2lTMDNVUjR6NWcxSTl3a3FqSUdJ?=
 =?utf-8?B?WVYyQkpsK1RBUytqT2RKQ2IvZElDeTZ3dklmZDlzUkhQVm13ZlkxUllpendu?=
 =?utf-8?B?VlNOeVVnYzdlVHpPZ1hsZEgzQnlyR3pzT1doWFFGWFNvWFpDQVlDbDV3TE84?=
 =?utf-8?B?bmlQMjZkdlRXanRuOVJxRFVkTkE3UDJTcjIrNHVHa2lSZnErSGFnL1kvSnFl?=
 =?utf-8?B?Y2grSWFiYVJXRUpaVU1vTDg3L0pxUjBGZ0pqamVHMzJxK0JTWVMyOGx2L3Qr?=
 =?utf-8?B?Ulk5VWE3SmpPci81SFFjVDZ4WSs0VFJNbC9Mc1FhK3VkeUV1ZXVvWGFMOWY1?=
 =?utf-8?B?T21FZjB2NkFMSU1UMDF1N29zM3hyVDVmL25LckNPcjJvd0gxbjA3VFdSUjE0?=
 =?utf-8?B?QWpUTFJRZkVqZGpXV3lVWm1JWG84SWlaWmUrOTJkOVFxbXM5UnJVTnhoVGNN?=
 =?utf-8?B?aXAxRjErZXF3bldLT3dBcy84ZGNnOW1XM3hicjdIcXFjV1UyMTRKZG9ReDRZ?=
 =?utf-8?B?WEFYYUh5SkpxbFJDWm4xSEoyNFAwL2lQNDNwczJ5dmRUYlNmS0RoektTQStR?=
 =?utf-8?B?NkxZdXVnUFMvaXdsRnJQNGRKcVkrSXJzNmJnS1NtTVN2Wk9QdXYwYkVUeXVK?=
 =?utf-8?B?aG0ydThJd1hkS0h3azZJcUdTZ3dHc21BdlRzeUpyUlVQQS9KelVmL1p2M0NO?=
 =?utf-8?B?QmYrUXU4TjcwV3JGY0ZuY1VCRk1BR1A4eGRnVHUwbzhNM0pyYVVEdmZOa1dy?=
 =?utf-8?B?MHhJTjQ0ay83UzFaUFczSkpKSnczNUp3SDBDM3VUcmhQTWl0YXVxRUpqRDM2?=
 =?utf-8?B?NUQ4SlhkNTlOb1VKZGc4c0loTGtGY0djbFR5THhJR29waU1LV3dBWUNkR3Vp?=
 =?utf-8?B?anVuVTFzNWdPUSt5VUZYYzMyeFZqa1EwOTRmMGFzRUJrelM3SDFRVndGYWYr?=
 =?utf-8?B?a3J3elhDVzA3UWNpNTdDQjY0a3U5U29SQlVIUkVwaEdCaDYvWkxpZ2o2OTFY?=
 =?utf-8?B?LzZlVVdCZ21XMGt4SFB3UFpMK3RPS29OYUgrWW5OU3lVYTIyRmF3ejJ4TnBa?=
 =?utf-8?B?QmNJZnFNTktiNzBWT3RCWGpGSTFIWXZQbmhoQnhVTlNDSElONHM1YWJXcmRi?=
 =?utf-8?B?UWtRVi9aeHFycFB0Y0V0TTNPVEFyK2pHK1dsOXdkdWtwVGNiZktwdlVzMFUx?=
 =?utf-8?B?cWY2S3VrSkkzMFJMcEx2K1NqdHhBeHYyQ0I0QW5wUTNKZitHVzVWVkVyd2Qr?=
 =?utf-8?B?SVdRMGJ6L3FmVGZXa2RQdDczZlFhTlNReW04Skg3NDlTRmJ0VWV4UzFOVitl?=
 =?utf-8?B?RHEveFpWVWNqWTBpWVlkcnFZYXBYTm1vSmJ0WStJRFNralFtOEk4bnN6ellj?=
 =?utf-8?B?WVVZeFpoTllUV2FTMGdmdnBiYTR1cXJwL2I2UXphWXhmNHhLM0h5RTYvaWFD?=
 =?utf-8?B?bHAyd3JtTWZKdGN5QVBMUDdjUUdDQUFDLzhtc3FaUUJOUTJ5VWNhTU1nYW1O?=
 =?utf-8?B?QU9zNXBNM254cm9QdHVkMkc2bVUzRERIL28ya1ZGWWxoOW16OVpyTFNTNzlX?=
 =?utf-8?B?TWx3UVR3bXBHWjJuclRwS2hqZWl2TGx2R051QzZ4SE9VdS9zL2tpWGpyQ0Rz?=
 =?utf-8?B?WnNrc0VZYk8rTVpCSFBwTDZYTWFjeThqYmhscnhUVEZVckY2cUx5U3NPRUdl?=
 =?utf-8?B?eWdHeXpGa0t4dU9xa3RwY000bk00MGg5cTMvTTlSTitPRjcvVXVNQ2UzZ3gr?=
 =?utf-8?B?Y0hxNEZOQnQvMVlSVDI1cmdKU1F6enA3cFlVaEhIZm1XMEFRTVhkcDJncmRt?=
 =?utf-8?B?dlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2a398a-cfa0-47e4-4be2-08dd87d01b8f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:16:44.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I39eA7jM5Jm/hyEYYpJk4xMsxi2OdvVdTFhwCj/aWSN1dSJDLjiabGx9zHObUq2ouYC6g8fcywWvAmsVNOtyuYOxj0tPx37B9D+E85yfS/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10613
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Apr 2025 10:16:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6791

Hi Adrian,

On 4/28/25 10:12 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> [You don't often get email from adrian.freihofer=siemens.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> The kernel-fitimage.bbclass uses the UBOOT_* variables. The SPL_*
> variables are handled by uboot-sign.bbclass.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

