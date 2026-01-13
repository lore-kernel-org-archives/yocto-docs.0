Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9530D2D0FB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:19:32 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58612.1768310371344931857
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Yk4CkgVS;
 spf=pass (domain: cherry.de, ip: 52.101.72.12, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/8x08nUmY/d/Iozo4fQ1FnieDQ7LEH/RLn5r9ODIUi4HzgF5HW5f6TI+6rxAav6w7PEtUe7p1zVyj0VheXnX3qe6k5E0dA0+xmG0gcR81tlEMRFnEvAIrKZ8Qd6sa2T/iS99SU6g6FISbpPbuYjh05hbuG/1enoo0LSR3OxHTpGLbEQAhJc1pF1EEIyZigaHxdn47xqyagPHztu/dypBIdK9SdYAkPPak6Pmctpy0yAh1HR3jHkn3ElcDg66QsIgKRDznTxww/o1Ngw+C3JgXg2RAx6v4HBDWOGMHM6MEL09wxYzuyv3ReeWrgfVC/opGf63oSzZMuyPtu99Tzb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH1sqszOPDjpjrtKx1W8tjIAh2+Cc2QOioHkIOfFrNs=;
 b=YxR39LNspyC004WL0whKvh8e1klCAu8U+j02QrWlusOI7GzkAKOVJXJSFjN0WZVw5XO3MNy9m0EgYms02N1GTO+vCrypElTTZS6jLaDamOolOZFBmmEJffrI94zzzGxMNlZ9fr4Pdwekjc5J/kUr0sACPgN9VIi8eMQCOp0g5eFSwgmCu3Ov9BnFpRI40BHyX3iwQYuDlcFaKKjZ7pAGwqs+n5g7swql/OybCXkwDOOePxdtsKm41fu6yFjtdjLAT3XhctjI0r6587H+aRSRQAdztQA3UsN93u2Jhi0EVvxFcZDGqGx1VOZfptEaA2BRUp0TxQH0zmC33x7nwjkWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH1sqszOPDjpjrtKx1W8tjIAh2+Cc2QOioHkIOfFrNs=;
 b=Yk4CkgVSFIJvwxpBfbKRtgS1HD2ezcIBzhUDsHLYmOwQ2D+NvScLXukGfKEYRt1mUWmWxtGk9adQ8aTCImo8rC1fIk/pmumeq+jm6ok+hizt0H9TWcCnu32ciO/r0qbQbrP41R0Dqai7Uuvv3YIkoAOIaz5aFgAfgTTCoMPBmoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8541.eurprd04.prod.outlook.com (2603:10a6:102:214::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:19:25 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:19:25 +0000
Message-ID: <2705e1c9-e72d-44af-8162-6ebbcef9f9a0@cherry.de>
Date: Tue, 13 Jan 2026 14:19:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 18/53] dev-manual/wic.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-18-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-18-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0431.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: e627c4ef-66f5-4724-69e1-08de52a65f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjVOdkM5ZzU4YWlTdVA0VnJlMzNrNjVsVDRGREdoQkhJQllYM2tuV1J2akE4?=
 =?utf-8?B?bitLaU9uejh3aThhTENZcjIzUGdzUTFCSDhjNVduTEpsYkFNajNVc1pqcHZS?=
 =?utf-8?B?YVJMOFRXQkV0OURyY0hNSXp0Vkh3Ulp4MG41N08velcyQjZ6VlprdTVOWEE0?=
 =?utf-8?B?VEMwMVNraVRCa3lFNWpUVWk5OXBGNkh6L3lzd0ZFRGFuU1BJZE1ORnJzUHRQ?=
 =?utf-8?B?KzIwaHJEbXZhQ2liSDBvUUNWUHhEOTFJZ2dLbmZoNEpmMUhiUjBYMUNtTmlL?=
 =?utf-8?B?TjlYQlVESEtNcVR3amdUNHZMY2s5b3pxYld5SjBnaWxJdFRXRFNKSUdYWkto?=
 =?utf-8?B?TVFVVVAyTDMxamVoYk1kbWMzQTJWK1ZHT2tPZFBUM2l2dVR3NmlZMVlBR2JT?=
 =?utf-8?B?RXdwQlpzKy9yaDQ5Q3Z5MS9tNWlSRkhkbFUvUWRzbEtBRWF6OHpHd0lxdmVC?=
 =?utf-8?B?Q0VhSlNJSmp0OXdhV25uREhYS3B0QmlQSE1Pb2lGV1MyZlIzSUZQYzZVUlpS?=
 =?utf-8?B?azVaZXR1b3BYL21iS09RK0xtaFpvbEMyTkRiUldVWXFuZlpwellYZG5STDZx?=
 =?utf-8?B?TVlDSjY5dTdXbElEdzJ3UldsVWdSeDc3aW5RM3BOMTNVUFVqT3c1bEtIaEJO?=
 =?utf-8?B?aVNHVW00dkk0aW1aNmpjaXNGR3dJWC9oQmFiUjdJeHpSeWhMQ2djZzFEbHR6?=
 =?utf-8?B?V3pOSE9CVHZtTmVTdnA0cnZITVhsbzMxSWlNSTl0ODVGcGdaQUNmWk9JNi81?=
 =?utf-8?B?RytUbW1qL1FvbXR5NVcyYTFlYk4rRW9FVzhkcnNQdGlzYjJpZ1lvZ2ZjTGJr?=
 =?utf-8?B?NDFHa1NCRkJ1U2RtdlNVRzBVWVpDZndSVXJxSmZKZms5N20yQmdVWUs3MDVI?=
 =?utf-8?B?MmJPemh1Szl0UTRYUk40OG5IS0RrUHBrVktqNmRaWjAyVGJKck1qdC8vLzF4?=
 =?utf-8?B?TUxER0VGbUpOZEFyVUhWdUFoWFpqZW1pbHkvYXBIZGdFRGwrWUVrSTJDaEJU?=
 =?utf-8?B?R280NHY5ZDRiNWo5dEJPMWdDWFdLRTZCNmRjRkVrYk45RlR5VTFHVE5uT20z?=
 =?utf-8?B?Zm9lMVJzcTFQamZ6OFpNSmxsbENPbzc5Q2Y4N2dkalFZK3dzRnhWa1BmRGxp?=
 =?utf-8?B?UjhwS1N2YkdtUkRkaFRIeGtZTGZDb2x3ZWR5U1hTSzNLcnVNbzR3WVB5OFpL?=
 =?utf-8?B?VldRRUlZUlBHdS82YXBNZHZYVE40YUpWcHhIZWkyN3ZHaG9vVUNnUUFsdXhU?=
 =?utf-8?B?YVZHMDJPTEZ6K1BWVGxZWEl6UmJxRXk3QnBVUGg1cTdHcExKNUFWckNFOERs?=
 =?utf-8?B?T0Vqb0cwYlk3UnFaT0NUSTZ2Q24rWHMxVGxYZFpZSWhGSWZwcDdmYkU5eTBL?=
 =?utf-8?B?UStEZDBPd3VLVzJhKzhjdGVUOXFkTHZzQzBNRFE1UTRFUTQ1eUgyMDBPYTg2?=
 =?utf-8?B?dEtYTlhJZlhoNjFNK1QyZVU5UXBFclArb1Y1TS9FeFV4Y1IvbXU3dmtLTmFW?=
 =?utf-8?B?SWhUV3BUWlJKT0N3YW9lSTV1TDF1YmZ6N2ZoSHZwY0I0RjZGcmlBTGtpMkFJ?=
 =?utf-8?B?V05LVmUwdUVBZmdOMzhRVFFISVAwNVVVVUY4VUVBYW85M0I1bVJYVXhhVXpr?=
 =?utf-8?B?ZzVGbXdiMWVhSVVBMENaakVvLy8xcTJGU3MyZi8vdytIcERYcWs5SHJyZkJ0?=
 =?utf-8?B?OGh6RXZsMnlTZ1NpTHVDWTZmdEk5TENYUUgrL1V3ejUzd0V3WldudDhMUmtv?=
 =?utf-8?B?dSt3ZTVteFdtK3o1L2x4Z3F4Nmk1MlZoQ2kxSTBHVDU4UG5qWUY3aHRPRVYx?=
 =?utf-8?B?dW8vZ083WWZlVU9BNWQ1ZVFZQ1F0NXJoL25CbDU1TmxLVG1lSTFMSWZVbTU5?=
 =?utf-8?B?QmVTZEQ4TDhrU0hFakdzd0RsaG1qK3BDYzM5bmJxVW1vZGxoU0dqSDFKUjg1?=
 =?utf-8?Q?FUwRcgSEhdDZ1cLvWQkrA5F2/oS1M1MT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXVYRmE1dldXOHVreTBFYnNHcUxCcWVwYnhkL0g0Ujk1Z09COURrNExqK2pT?=
 =?utf-8?B?RmhRVTE1ckxXMjVpNUZmWmxWNEtYNk1IUll6SmV3UEdSaE1BeHFoai8yb09X?=
 =?utf-8?B?cUE1TU1MVkp2NlNNdjlya0VPbDRxNCtzK2FpY3JycW40bE9hYVZxc3N1NnNZ?=
 =?utf-8?B?STJ6M1NuNGI2UW51c2ljcVZ6U2dhYVBrQ2hrR3lXU0FSZjE2amtqZWx4cXU4?=
 =?utf-8?B?VzZaNFVtdHRTemRxOXl6MWgvY21YUUNkK3B6Sm1IMkZKNHJhRXRraTExdWZD?=
 =?utf-8?B?Z1lab2NXeFZYWEdoTXhxM1FCNjJhZFVqTWVzRThjQS9HakhoRzVFSTNscGZ4?=
 =?utf-8?B?NklPUkZDU0VJRGUxVjRIbkZ3bHF2MzMvSTJBbG5oZmtUQjd4M2R3U0ZPb0hv?=
 =?utf-8?B?OE1YY1Bhamt2eWQwTmtraDRMQkNZSjVkL3BpWVBseU1qMDBUNE5HazRCMUFZ?=
 =?utf-8?B?bjNmeWtQbkJzQlJuNVd4VjBpRG9ZSXNuZmIxZ1hHR2tPNzd1NkFhOUxxRHhM?=
 =?utf-8?B?NXIvVllVUTBnN2lqYjQ0TzRIZTRrTXV2bGp6Vko1YS9TTlcwR1dJei9GcGRp?=
 =?utf-8?B?VTR6Q2d4dFZYOTQ0TzhFQ1VRWTRaYUwzbkVhRjQ0L1dFckpIcGFBNzlwWkc1?=
 =?utf-8?B?Tk96eUtOdzFCZ0pGbnQ4OUQxUEVOckx6NEVoTDg5SkprV0NiZGE5MlJvRHdt?=
 =?utf-8?B?eUoyakRJMVZ3bm80cVpTNGN0c2xINFZjMmRxN1BYZzNMeHM2Q1ZabHV5M094?=
 =?utf-8?B?bFRzZ0F1ZjRDd0I1SkNSZXhzVFRKcFVuWWdMSzJVMHB6czRXRDY0WnRYbmZG?=
 =?utf-8?B?M0pkQWlzN3BJUHFCRVR2SHBqL1ZqZVczTmtUVjJQOHdjMW1Uc1ZmM3diNFp5?=
 =?utf-8?B?aWlIZDUzVHd1WkZJU3M5aTQrWnZweFFzc2dQend0QTdTY09ZYkRPazFiTmhw?=
 =?utf-8?B?RFZXTTRKNW9kOVliTHdjU0F6WW9TdFdKRlNLNUVKTndkNHZSMnBncnQrK2V2?=
 =?utf-8?B?dS9ySDA2K1NqRHhkNmUwYUM0WERtcWNlQitmQjRkMEhPVlRhc0dhc3oxL2hn?=
 =?utf-8?B?eSt6MW05Ym1FWlZaZjBGR0VWL1NvWlRqZGc2OU9iN1paMlJaVVZYZ2lFSG1m?=
 =?utf-8?B?L2lXRzRXWExlY05iVGk4ZWk3M2t5ME51dDRZREkxcGJsZnBDczZ1aG1zemIz?=
 =?utf-8?B?SnA1ZjVIOVB1Ly9SSjFLNkJoOVVqQUhVcjNBNDRWakpMZlpYaFAzdGRQMXJZ?=
 =?utf-8?B?UlZDZWVhNE9WRysvWDNVbmxoLzRtQkVlWGgrUmg0ekI0WURCZnlVVTJBVmNh?=
 =?utf-8?B?WVBadEx5bjNUN21ucS9Dc0YzcUptRDEydENpWGVLTlpQVXFhK1hNRDVtU1RR?=
 =?utf-8?B?WVN4bHJ3TnBub3BvaC90WVNhV1VOREd5cy9CTXNRdWR0eVFBSDN4RUtlWldV?=
 =?utf-8?B?WUYrVThFbTdqalZSeGhJbi9qdWhxZU9UeDFaK1BmWXJPRW1DRGJiZmtVVzRF?=
 =?utf-8?B?di9ZV3JlRmh5WXNwSG5nVGVOVzVUV2poM2pscVBNY3B6bGxVZkFLN3MvTHFW?=
 =?utf-8?B?QlNhOTB3bDBiOGZpZG9rQk9jS1NwUXdBd0RyaUNVSFB1elFwVjJvY081ZGdY?=
 =?utf-8?B?aFBvTHRkSEtyUzc4K0NDaFhTN2p4bDREUXdkU3lyeGUyS2FWK3FzcjJWSGhy?=
 =?utf-8?B?eGpSNFprZnc5Nk1BRHExVUJEaVUweENmODhUYUQyYVNxc0hPbHNYZlh5UGdX?=
 =?utf-8?B?YTJVYVN3cHp2Z3BHMy9PYUcyQjBZanJsUVJMdFZDWlc1djl5RTRJUmhnYnMv?=
 =?utf-8?B?ci9kWFNBYkZoS2JaTmpkNVlJOC9WZk9Ic1hOSHVwTEthMTVRNVg2d0Q0L2hx?=
 =?utf-8?B?VWZDZTJEM2kzaVY1dDMzUUU5M2FvYkkxSHQ4czBYcmxiUGwzZ3FLWnFlT1RS?=
 =?utf-8?B?QmRLQ1JwZ29mVU9JeWNQa0F0NXlhR21RZGpQb0xtU0tRQkRIQUxnQzk1d05l?=
 =?utf-8?B?SytKSDVQNE9xOXQ0UVA5a3lyamJ4Z3JXZ1ZNaDc4c1RjS2pjRWR2MjJrZlIy?=
 =?utf-8?B?WEdUaFd6UGl4c3lkQ3dPaWhXWnNvSUpZQ0RzekhoNkV1Rk9FK01DVk5zZVBp?=
 =?utf-8?B?Wkl2OXRTYnhEUDBscFcxSE1nYVRlNHFiQmpGYVRoMENNR250dGVsckh6OXpu?=
 =?utf-8?B?ajlKNmJBVys0MjZDSGhiT1p0VFcrWit2VmtESG01WFlQcFphWnhZZlBvVGll?=
 =?utf-8?B?NGhhakl0dnp1ZVJUTStmZUh6V2R5bDk3bWpDb2hBZ0tWR0dVTFFaUWJmK0da?=
 =?utf-8?B?cytBcCtkOGQ0cDdHYytzZUIyUUFBM2pTQkFsWWxkY0hZV2FzUXJWUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e627c4ef-66f5-4724-69e1-08de52a65f6b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:19:25.2954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6yqcA3IG8DkUa48vvEKMHsGrjpDF9Ga9BQ2zZTUkZorNWfVnZfnvlXi2veifWXLPMwkMytYzS+RqpFfv6SLjQ/yPkEIBHi6y+6t7qeKMKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8541
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:19:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8507

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/wic.rst | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
> index 07170537b..a7c4ca06a 100644
> --- a/documentation/dev-manual/wic.rst
> +++ b/documentation/dev-manual/wic.rst
> @@ -276,8 +276,8 @@ existing file provided by the Wic installation. As shipped, kickstart
>   files can be found in the :ref:`overview-manual/development-environment:yocto project source repositories` in the
>   following two locations::
>   
> -   poky/meta-yocto-bsp/wic
> -   poky/scripts/lib/wic/canned-wks
> +   meta-yocto/meta-yocto-bsp/wic
> +   meta-yocto/scripts/lib/wic/canned-wks
>   

s/meta-yocto/openembedded-core/

With that,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

