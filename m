Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3BECD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 14:45:50 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20409.1778078749005990739
 for <docs@lists.yoctoproject.org>;
 Wed, 06 May 2026 07:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=f3OXcGqb;
 spf=pass (domain: cherry.de, ip: 52.101.69.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQqZmXfh9SuK6mt/WU0vtBdXYYpLByraPJ28jppqncVmjsgEf15sqhPOORRs1bZ/6C7Oqvy4+B1zVLJV6NqXwP+FvTpUMu1Qkt936dCH5c/5C9j29qOh1PDkC66S6OrMLBf6xeMpfM+/Ghz+hRaUruDUmPzWCLkcRbWZ8XZGI62brtO7JkSAmihnXZPscWh/14YIGhggm9i6ARCpncdSmjdOud4lZVGEcCqQShQ79pkAMT+M/hDDkRpvWccsBf8tbdEjKy3bkY6i+J4Ddr4ZgPuUjMry1Dv6+XhWfoIMUDXXZhkaIlsBPVEmc/v8osKDaRnRiGAzBUE5zfOhMKTZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/2Ab4xrWaE+oy4aBXT5UWF6c/20Epo3KE7EpS79SU0=;
 b=ItEg6RKZsN8b7AdC09CB422p5EbOl7JHO8IqRNRNwDHpmq8T3XnhouASbkcOJTx82ux8wJ+s2DVupTWCP3NnbNALK1tW2Hj53cR+/RW2Sea3WgaGRh064vtwNcfft+9F+ybwL1kBTFkxM54fwjF7Ko6zXh9WY5SqpZjVwHY944oRL5ttvg6ItZvKHmUFeHdzHRLH4H0Mg1JuCxzDvfSwPeZqBP9EJNPDqk4mdlA6vCU+lJyGs83P7fVtbydgHWSU3ap4Hdh6WbVMKk0q1jUupAI07ZV9SReYPRdJRQX42wxs6TDaS1gr/woeOif8UDDl0QJvTcIZLbDobwdv+rFNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/2Ab4xrWaE+oy4aBXT5UWF6c/20Epo3KE7EpS79SU0=;
 b=f3OXcGqbFJG/ABEk7L6X3mAYHlf8pabPzasF27DsQfzm+4VBshHBiSjD+0IdnFNHrXd2H3ilgtxjaru/mYy4Pi/xnPAG3rupjHexJC2fFnxMCWc9ZI8dD/YEH9qQW39E5r0/Q/ltzvbpNimQ+s7XnzjmJJSBRomatRiRzPAJSDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI2PR04MB10287.eurprd04.prod.outlook.com (2603:10a6:800:220::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:45:43 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 14:45:43 +0000
Message-ID: <0e18da3b-aa9d-4be5-a952-71a0d17bde13@cherry.de>
Date: Wed, 6 May 2026 16:45:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 17/18] migration-guides: update 6.0 (Wrynose)
 release notes
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
 <20260410-second-release-notes-6-0-v1-17-40213436c3ca@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260410-second-release-notes-6-0-v1-17-40213436c3ca@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:802:2::18) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI2PR04MB10287:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc197ee-5dad-47d0-3057-08deab7e263c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Wr+dclHKhSn36dVNXyqJ+421m/BVOGs2AoFKoCvJz5ai0PRx0sLuzX6t+dHyeZmbzIHn1sZ83TvLr2/RCslNcs+7clZdD5Yy8BWwgVwYN6362gAdiKWok9LtOHzSOfLD2JBELbgWyNM/vyrLPufzGtUG2opJSFEEgQ7CJcV/He0tN7e+DZG5iMfF6mvI4Sj3w/pimDf2VpTfSO62I/9uijgtY4dUuVjhzgzxT1JVsgoFjxWIlFWEeG79/ijASD4XA6qWGPR4dHdGoAhBQ9aCGh9A1W4e2GBxqV8DXvfHk+eaKTsdnJ9B6wdOibyAYj3FBUhH8/qwUyBgId5hR0/zk10LzVyzqt9NEqDFwdkOcc2raSchzqbc7aiK/VjMPS/awwdgJqMNEfxzXe4n/CPP01G5Lw1Jpjp7ZosiIekMigGUAeod107satzPrqGM/cDPn6E5bn0AtS+H09TFsjaLOLjYmNf4MaNricMiVOcY2s6o1i7UBobsEAvu8xlTt9us6rCh/FiGCWWCfsxNZJYaRsXsyfysi36a/Uo6RRD7nTpFYEvn6Qnm/bDF8yS9dszM6lCOjGl7//1j5GRkZCy04x93a9G8l86MEvUBunfVaIEXjSaY9N78KtRaBtR/HSdnv9aPNFetVYV2gzdw1KX7Aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VERCTzRwN1gyZ09BMGFlNzdmeE5JOElLZWFJMG5ycU1MSXJUT2U4UThKMDhz?=
 =?utf-8?B?MXJMclNyYWtPWnRUbi8vdjNsSlo4aHFDdUtub2hCczJTVHZHd2tKNk1mWXdh?=
 =?utf-8?B?dzZWYXkwdVUxN0R2WnE0MklDRkVlNlVlQWk0ZGxmMWltUzg3UjBrelpQeVVJ?=
 =?utf-8?B?SmszcFlGUzQ3R0hlZkdIYk9leGtCdWJianR0UENYcUhTVTlGenFhbWNqR0wv?=
 =?utf-8?B?WHNXZGIrYjFSa1V0RTNRVGhsekIrbGdXZlljdkVkWXR1enFQUXExMkhhQUpo?=
 =?utf-8?B?MlU0RDY0SlR6c2dNTXdUS3VpRURTaW4za0dMaTQrTTJSWEc4T3JmRktUKzNx?=
 =?utf-8?B?N1lxRUszMXFLMjFBSjg3c2hLaC9taVhSTW40THlyTkQ3bHhVMkx6elc3dTU3?=
 =?utf-8?B?U2xacnF2QjVhancwc2tuTE1GREUvWHkrVVVZVVVpem5uWVVuTWZpTkhKMGc5?=
 =?utf-8?B?S3htWXlWOUdDcG9qOGdCd0ZlSnJGN3ZuSE5VbFNGcUZkeUowdHIwdlFCcDdv?=
 =?utf-8?B?TVdkSVNQM2owYkJRd2NPYzVJTlEwWGtVM2M0aFg4cE0vd1puWE1ZWXU3VFVq?=
 =?utf-8?B?aEphTzJXWCtEaWRESkJ5UWtIbncvMlI0NjZGeWJEYXNBRGwyYm45R0xXeGFC?=
 =?utf-8?B?TGNkSjJXeTZGVlZtZDNoZ2NmRldsRW9acjdyNVBtZUc0WEdDRTA4OWg5SXlt?=
 =?utf-8?B?bThxMWRiWUJKYzVSS0ozT3Z4akZFNTlEU2JxNlNhbktIbm4zcXhoWkxmRUdj?=
 =?utf-8?B?Q1JWRHZkcUMzcDhEN0hJK1NWYTh3VFBjSDBSZy9rcGtRcFpmWTFOY1B6VzdK?=
 =?utf-8?B?OEd2akdySlR3MzJ3VHlFeG9vdFd1V1ZQK0htQmpmUElydFVzZTFublorV01a?=
 =?utf-8?B?VTllQ2c4anlEZHYyTFhVVEFqY29yOXdlcjVLay82eDJUWG0zVFIvZXBxV1J2?=
 =?utf-8?B?eU5KTlhlOTRaR0QrSStrTDlTaHNNZzd4MVltMjRqM0hKWUw3a1ZjM3ExRVVp?=
 =?utf-8?B?QWhUUHBxREtPV1hSbGhXZCtWN0RkRUVlZlZWQTRRZDkwbi9oL0xVZmN6dHN0?=
 =?utf-8?B?T0xjdnVOZHNIUVJOR1M5NWI3NjQyYzNPcWJTWkJ5TTVlVnAveVptWE8wcGVj?=
 =?utf-8?B?dnlyZW81R240VVplbnZFa1grd1dxS1hLbm1KaGxGejl6R3dyQmVDbEpPcmw4?=
 =?utf-8?B?YWFYQ2Q1dnB4MGt1M2ppczRvdlhoWm1ISGc0WGpMcXBmTStMZk9Pb0tHUzky?=
 =?utf-8?B?Rkd0TlgwckQrMGg5NWtDNm1ydU9CKzhiMXBmZEdrR2FieldzT3pabXNjZDRx?=
 =?utf-8?B?bVRSdkt0WGR3cG9lMEF4N01GUkNMQmF3VjhRUytNdFoxUmNHYnpNUFRoaEQx?=
 =?utf-8?B?a2gzVmFSRExzaitPbDlaZ25obm03SlVRSVFqa1dDOUNuYTB3bUNiRXdnQlpQ?=
 =?utf-8?B?b0ZFMFdXeFByc0Vpcyt0cFBtYVJXK081UnR3UVRYVlBORTY1aGphTGx0NTkw?=
 =?utf-8?B?SkhMbEJ0OWFFS21ISnFzNzBhdTArMkVwVklCdFlvbHVUOE9IK05qNFVJeEJk?=
 =?utf-8?B?TGpoTzVQWkRpZHBpbzhib2kwOUthWEgxYzdpRU5HOWRRdENvSnZWTEJFcFZu?=
 =?utf-8?B?Ujd6Sk5FYjYxVXRmNmo1TmdYN25TL1hQMjFRSEhlVVNHaXZYS04vUG13eUk2?=
 =?utf-8?B?WDJvNktUbmlPVTk0ckZxK2xNV0p3K3NTRTNST0dVaHJrUjRNVGxES3VXYnl5?=
 =?utf-8?B?NHRGaWZRYTFjL05qVjFyUE5XVTlaOFBVMGZxV0FMQ3NDUHEzYUtYTnd3NnFO?=
 =?utf-8?B?RllvU0dKWGUvVHVQSnorSEVBZk5rbysvbkx5WUgrc2h5a0NrOWNwbGJZdm5y?=
 =?utf-8?B?MkRlMkI5Z1hZWVYxeW9rejRDK3RYbVR2ZDcvZWowbHpWdXlmVkwwOW9oZFN2?=
 =?utf-8?B?TXBqSFBuZlp3OFdXOHRrYk1sK1ZPeUxIQjZDUmxqSGE0SmJXaFE5TllscnFu?=
 =?utf-8?B?ak5MN1pvQVNrNVhYa0NSL1lNTGUxV0x3SGphU0N0YTZ1Rkp5ZnFmRWVOUmlx?=
 =?utf-8?B?ZFV4RkxRT2xld09KdFEyQ3Jocy9CZjBLdlQxUHRZcnFaWC9GS2lGRldTMVcy?=
 =?utf-8?B?b0h3WE9NTHJlQmlydklZUkhSZ0pKZmFZaVIrWjhxMkx3bjZlT1dlNHhic3pT?=
 =?utf-8?B?MXY1Q0txbURIdSttaXBUTEJGUzZtUGYrRVZpTlBvUjZLazArY2N5Y1BiSkt6?=
 =?utf-8?B?RHpzSEhPdkpGVzhMZC8yd0VUT2IyeHIxWUV1Z1V0UzdUWmg0ODA2aHU5Zm9P?=
 =?utf-8?B?Q0hQa2ZKTjhYZHlDZW5aZkVETWFtaUtNY2RWN294dUtWTzdJeW5JTitzOEM5?=
 =?utf-8?Q?/krMtHhmgUpSVFiYUSnAuxKeBi+otrnUgHr5jr94ozKLt?=
X-MS-Exchange-AntiSpam-MessageData-1: tQkWpYoXwLCBBzP2kRyIez9UYAWLK5jN6aM=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc197ee-5dad-47d0-3057-08deab7e263c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:45:43.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhqRuZb1rEHkg+pHhORUFRS3zU+ce8yCUnXLnJDn5PFntHDkz0OpH937qrt2/RlC9criaETs8eGedYymhkCH9XLnt+mIJ2XXwIB1Gsgbbyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10287
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 May 2026 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9395

Hi Antonin,

On 4/10/26 4:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
> +Support for SPDX 2.2 removed
> +----------------------------
> +
> +Support for generating SPDX 2.2 document through the ``create-spdx-2.2`` class
> +was removed:
> +
> +.. code-block::
> +
> +   Removes SPDX 2.2 support in favor of SPDX 3 support being the only
> +   option. The SPDX 3 data is far superior to SPDX 2.2 and thus more useful
> +   for SBoM uses cases.
> +

We have a mix of SBoM and SBOM in the docs, we should probably be more 
consistent there. Wikipedia says SBOM in 
https://en.wikipedia.org/wiki/Software_supply_chain, so I guess we could 
go with that? What do you think?

Cheers,
Quentin

