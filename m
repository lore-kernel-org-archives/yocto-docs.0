Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBFFD5CC87
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:24:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.87])
 by mx.groups.io with SMTP id smtpd.web11.11607.1730283831972821109
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PSv6ObET;
 spf=pass (domain: cherry.de, ip: 40.107.22.87, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5srkT916v8+sz0699k77cR6GM6Jm/SMYQT17WewGN6tqbnbRI4w5wJgHHp9myg/s+Kr8gP6uWbIcV3Y74FjT6SWpRZokqqVs8GJnXMX7oBAxAiUA+lIRDmwcG47hm56om0Ks0WKjunDd+shqx7C/++XQDaUY9wh+qJxDOckhCW7wsMDOvMXmd/Tn+FsxjaBSUqP12mBr+Gbs1q1LwDmWPCsqootAaQ9OquAFPzyNKUGcfPYzfkePL3I5xuFQv7Y/742+i+TcP2GRsVGVg+jSIM9nHdM9kTgKn3ce+WMfSB+OEx9WvTyxbnJ6ZAWniTa1YfcJQoOMuvz8XFDLK8vuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VQML8c/eVAltfo7dmWG7f/VHXNSrIIL3uxRTum0oNw=;
 b=JLJw1vyscGu1tsgtZhpPUtcRWuKwqyKlZUGcNjiUbVTudL9cJg+c0kKLV59ozhAZG5xchRipqxkAiSOuhM9xzy6UJAmRrnENWz1LTQaC60m5JsXALXWFZxQJHp27qHVkItyqpdapLm8X/3wSVmYDedqO58oxSovlMHWitvJVHq6HVyR9caw3sRIiezs2iAM4cdUjT79ftKjOcM2M+qWjBYljSKk4mRiPdX2/lGQngZtKKncROooHyOt7CvNV3QCEASt4Ce7EiKIzWnKxr+N0owNzJuNLv5RkZQ1OJhWl8ZwMkkAAClfOQMEGvGx0fDUv8zUH3ns0uWiAVWB6cxfXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VQML8c/eVAltfo7dmWG7f/VHXNSrIIL3uxRTum0oNw=;
 b=PSv6ObET6H4xBlmwalDw4MBuSdnAGUMmgtOyOqZKVTRzvS7RjW3vrGIIlYj3LPmlTdCa4vdEwIJEG+r1q95SmWwlsnZgJN0ctwCgjg7Mq8sYSdwZ1uTpzcyw1o8erFXdkYISkQSpH2c9jeXsOhdFlVhLgXNq/stDTWyIiIi2oUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8971.eurprd04.prod.outlook.com (2603:10a6:20b:40a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 10:23:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 10:23:49 +0000
Message-ID: <7b38ecbb-9dac-4746-b542-30972cadf07c@cherry.de>
Date: Wed, 30 Oct 2024 11:23:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Improve release process section
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241030-update-releases-svg-v1-0-1cafebd6c6d9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241030-update-releases-svg-v1-0-1cafebd6c6d9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 156a0288-a9ce-4068-f74c-08dcf8ccf1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ajdwbkdSMW92OUNDUjZQeXdTNk5DdVpENFY1L2svM28vaUJiY3VHTWFjVDFx?=
 =?utf-8?B?Y3V2UVZ5N2VHd1ZVL2ZkaHh1RGp1SjdhZ0huNXFQZnM0bXZBMXhSVisxajlk?=
 =?utf-8?B?cHhrRWtCRC9JQVFuZ0NVTHg0N2NRZC9mMmlHazZXQ1MveVIvNmlnaDRKTWdz?=
 =?utf-8?B?L1pOejhjY0cybUcwS0FQbnEzVXd0bXFQYTduZ2VqRndNelZWbzhlWTVzRXFT?=
 =?utf-8?B?VUlrSDNqTGh2dFdIbkFGR0R2R3pjMkFJdzFZcHJmUFNxY0tYQ3lHVm5tL0dH?=
 =?utf-8?B?RGprclB0dHlJa3lSZ3VNMFZLa1ZKVFBCUzVxLy9JaXFYVElqbS8vL1p3L2d5?=
 =?utf-8?B?Ykk0N0IxWGlYUnlNK2NVUC9uUUsrcGFlSjc2QUplaGQzNjBpY2FKUkJPOW9C?=
 =?utf-8?B?czlDVllsUWh1RDU1aEVzbGJpd3kyS0ZWcmlKQVhCcXVzOUZTNDRBSnRIaVpo?=
 =?utf-8?B?ekdZNFhMdHdscWVRczdsRXZxcVNsK2xrUVVHWTJPZEVMWDE3ejVXWklNVE04?=
 =?utf-8?B?YUFrUHNVMElPVExHQjhrbVQrQndtbjJSZDhXRDhrZmtSOXpIOGp5VmNYbTEr?=
 =?utf-8?B?K1FmYW13dDc4R1hCbHp6V01XM1ltTkxDc2h0VUhrN3VoeWdhVEx3bjJEY25K?=
 =?utf-8?B?a2doNDBFUm41MjN2NEp2bGhPRGtpL0JwVFI4K1lLMDZCVjNBYXpJTWpGWDNr?=
 =?utf-8?B?VzFBa0puTERKTk5laHl5MERXeUs4WTEycU5DUUZDRWtxVmVwNlQ4cUFLMkZZ?=
 =?utf-8?B?MTQzY0p6Unl0eExaejNpT0h2aGg5bDFhek1zTzFzdGczanNKcnlMSXNBeC9C?=
 =?utf-8?B?aTFNc09VU3d3dWtwNTJiZlpRQkxsQUpibEtHTjRib25iL05HbmhwSHU1VEJ3?=
 =?utf-8?B?aTBlWkFuczBHanhMVHBHUGNtRGNwVEFaU21JdDlJRUNaOXRJWmtNeHFFdmFR?=
 =?utf-8?B?Smc2U0p3bXAzbHgrQ0hDZHpuamg3akxyUVdvWEgzdkcwSVQzRlY2TDF2Ty85?=
 =?utf-8?B?d3hwY2ZYSklqT1pjZWhMSk5Zb0M5akM1UTF1eXVpUGxZYnI1NnFYQVFEdTVp?=
 =?utf-8?B?VGVJc3h2RUEzUzdJUjNtQlU4cm5wK2FscWxYZjVER0lrQXMydnNHQXBkaWRD?=
 =?utf-8?B?RWJIU2g3NVl1dzdYb1ZwWU1Jak54NUoxSk5PZWpzYVlmVXZGdWRxWjE5bXVy?=
 =?utf-8?B?L3ExYllGWmRROG5uT3E4WnhncVNqMlREMXd4WFFhZHBHcDZXL1lOR0VrYThV?=
 =?utf-8?B?eEM5OTdabjVQUkFRbFJPZ0syM3l5Q3pZRjhJc0VIRjNrK2tPYUlkRGRGK2RW?=
 =?utf-8?B?V3BEMlJra214VG5Pcnl1Mk5MY3B1aXdWNFBjZzVXVDFkMS8wdkRFNkZQZnhX?=
 =?utf-8?B?UjBCZ3pwOFJKb1pJRDdSTHZZZFZYSlhwOE5yWm9tM2ptM2RnUkVBeHAyOENO?=
 =?utf-8?B?YXVWa3dHV0xkalZtZ2cxLy9uY0lQWWc3bTV6ai9rYXlOa1NQV2pXY2oxQUVs?=
 =?utf-8?B?KzJDaEdZdXNGNnJRTkRmZHVuYU13NkI4b2czZkpDQ2xFUFZVYkpTVGE1TUtz?=
 =?utf-8?B?TTNRWUxBeWZQNzlzUHpKRjd4VG1mT1NtU2R6ZVA4dTRNOE9uNHNJbklrOVlj?=
 =?utf-8?B?am1XSURqVkh3cWhkVUo0L25DNTlKMXBRMlMraVRFVWJHZFhiQ3lSQW52QUVr?=
 =?utf-8?B?eDAwOTNaVTZBZm1Zd1NrK0VIWm55RmgyYUE0eUN4WmFMVTdtRHdYWDlFRm9X?=
 =?utf-8?Q?O+nQUCXZDNdIv7tQEHc8YVrkXBGM8TgT/b2yhGf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SG1wK0Z2MHg2U0hsclNhaEdpaW04RXZhcjRZTno0L3VXNVZpOVhabFk4K0dI?=
 =?utf-8?B?bC85dTlQTFpCUnFFYzRYbFJJU3pqVkdmbXR1WVllZ0dCd3BFNUY1QWlZb1hs?=
 =?utf-8?B?TlJROC9BY0o4a2I0YkV5eXVUWDZaYVB3NGtaSlRDYkFTYWhyT0F4cFVmQVlZ?=
 =?utf-8?B?U2IydlUvR0dWeTI4K3hLYlJ0bFZrREVrKzE4SEVwaldUbDM5MURWTlIzMURG?=
 =?utf-8?B?M1hDMktJSy91dXRGWFpyTUxtbVNRdjlMZ2gzemhoei9hVzZpZkNJUDdSVkhY?=
 =?utf-8?B?Y1pKV3VZZ0EvcEozTFg1T1g0Q05SU1BReTNVZ3dmMzFDdHpwc09tTGtGQXU2?=
 =?utf-8?B?eVFoSGdWbzRRL3FmdDJyUkZsS3VXUG1mT3RuNFBjdlN0OTZZVkpvRkY2TWlx?=
 =?utf-8?B?elhTdnQwUWwxb2dUN25saklzbDg5c05xUGpSakt4SzhQaDdpazlxU2ZJakVh?=
 =?utf-8?B?RnBkaUxpQ0RVVWszOXhMNmY0ZnU1VHYxR25IbDYzeWcyOUxMdk5lT081cG12?=
 =?utf-8?B?V0pSMmJjNVpKS2NzRXVxdEt2ZzY3VG1jS0thNXU0NGtOVmpmR0xhMXBNR0Rz?=
 =?utf-8?B?NnZGdmw5ZVBYN05vNUR2V2htdTNZbjRjUUFPMW13TXc4SWZ4TFRhbXN2OXVp?=
 =?utf-8?B?YmlxRE1SUG1SMzgvS2NPY21UWUYraVZiTmU0a2VNZWh3M0h4TTJRSVhiS1Ft?=
 =?utf-8?B?UTl5VUs1cUNscEFGOWFUbDk4WS83OWV1ZW9uSmM4TTB5MDdSUmtXWUJMdnll?=
 =?utf-8?B?MjVQMzBKQ1NiaHNPazd2eFJ4c2UwblFjN0poc0ZtOXNVdjE2M2tzSy9oTVgv?=
 =?utf-8?B?aTQ5bE41S3FtanBOOGdpSW1rQzZBV1ZCQzBla3krVXlIbU5JaDRTYlBVeEdo?=
 =?utf-8?B?cmkzK3VYTWJzbWZLUEhJWHhXaFBtbkVGbjdFdmhiWEpOR1FlOVRKZVl0aU85?=
 =?utf-8?B?Y0htWjI5S0VWNXI5VFZaS1ZLcU1rcWtNNm16bzBZZnc2QmM0MGgzelpaNFRV?=
 =?utf-8?B?VWgzUi8wMUVlS2cycXdLZVVmVzZaZVJqTVV1S2JqcUFUWld4c0x0bnJ6ekZ0?=
 =?utf-8?B?WDM0SVBEVDNIMW5yYktXR3VqSjFYcU9RU2FaYzBuT1FtMkxNNWdWaWdSY3ZV?=
 =?utf-8?B?NGh3UVBNQ0FoQ280NEV1Ym5hM251V0JyK2tlQzBEU0hBc0RzSksyQXRqYnJo?=
 =?utf-8?B?Ry8wTWo4OUFvazhueWNHTTEzb1lleXVURit5WEJzR3FwVWI3WmxlR1k0b0dO?=
 =?utf-8?B?Qm9idFUrK1JCRE1rNDZ2Q0hTVGFyWmhHWXp2UjdKQ3VmWUk3bWZVOFAzUnZz?=
 =?utf-8?B?MnhLSWJIM1Q5bFpaWTVSdXJ2QkV5TWI4bkhDRVM2TkNiR3N0L0o3Rldxa0Ir?=
 =?utf-8?B?ZCtOT3JZZVIwamtuSTBGL0dKUWpZLzU1dDV0UWI5bzhhS3NZcENkckpBckdv?=
 =?utf-8?B?cDVVYTJ5MndEQkxKOWkzOTFRbGlxdXlYL2cvWWUyVy9PSnRpNnNQczZseGhN?=
 =?utf-8?B?VVFBT05aRis1Q2lMSDlpc2wyYWp2M25Xb0o1ZEdnbWJkelpZVWM2a3lad2RG?=
 =?utf-8?B?QlM5ZThRVkdoc0FYRlhrSkI4OS82a0YxQldaM3hRS1pqb2JLWERWMkIvTlNC?=
 =?utf-8?B?RE1OVGlDNnVvYkN3STVwbFh5TmNRMmNnOVJ1M2xhZ3lYWml5cGtzalQ4T0VW?=
 =?utf-8?B?TktJK3Nac2g1STA4ZStTbG9reHp4SUhkejZvN3RtUlUxMFVGRGp0NE01RWh4?=
 =?utf-8?B?L3NlWStuZHhTZmlaTEh0Y3M5YUttZk8rMDgwUTdwcVcxMmM5aG9XMGh1R2FN?=
 =?utf-8?B?SUNVSmJsVkorYk5ydk40ZFhMUDFXWUhtT2Q3a1N5K1ZMYmF3dEpPT050YWE4?=
 =?utf-8?B?TGw3bnQyNGd2dWZkWloycDlBK1c4dWtlOTRqUUtqcWVGL21ua2p0TXVSWUlC?=
 =?utf-8?B?bEdpVEhtYWxPdVpZbThRVkNLcU8yZWU4b2lzWWlQRUdVaGhVQjJMOG1JRXAy?=
 =?utf-8?B?di82NGJrYjhPOXBTa0FZRnFpVHlHa0V1dlkxL2FoY080c05UNmo1cWVRejA0?=
 =?utf-8?B?SnhCM2w1M2RJS2lyVG9XNEh3RXo2Zkw5dXZicE5yY3V4aGNScWhId0JGRk9y?=
 =?utf-8?B?bWFyaGFNM0JacThsR0dEaFdlUTlXU0d4Zmp6a000VzBuUmVUWTViaFg2MmtP?=
 =?utf-8?Q?Y0s337lSOVyrKL/uQ3hNqEA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 156a0288-a9ce-4068-f74c-08dcf8ccf1c0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:23:49.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RniyJKncublaP7VcILmTcNGMaiXGZyruVkamkwUCtXfcpMTQJZdtfyMHQALpU8kUB6BaENwZWN9eB+H6dSUdaMNKENompdIUrq7VpcB5Z38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8971
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:24:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5618

Hi Antonin,

On 10/30/24 11:07 AM, Antonin Godard wrote:
> Following some discussion about the releases.svg file, timestamp the svg
> with the month it was edited last, and refer to the release the doc was
> built for using &DISTRO_NAME.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Good enough for now, maybe we'll come up with something better in the 
future.

For the whole series:
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

