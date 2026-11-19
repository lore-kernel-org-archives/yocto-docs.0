Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13313.1795091372889566017
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 04:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lNXjtpAz;
 spf=pass (domain: cherry.de, ip: 52.101.83.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+W2nFcCroUxDohJDdA+siSWCFJJPq2fRrV2z17Hz1myFTBszkVNzFx4s4U9a2qYxWfdX39og80ttjhVfdXi0s/EK5eWqrApxJQcgn65d9SfyecfMZkAL4B7gC+cK6X4tofkiGox4kvFcvgRRkKFWlIPOvMKhnnBVnvpfTgCOBEhjHDOFe1FCZs2djQ/2S4Iiar+N6ZC9GorP8dXx0l+xosRCOAS3zsFQZfNggFpWOvns5DXgB7aVpy92c6/Hi0NdfXIem8OKl4TS3fPrapLJMCgoWIlr1aV09O0htwtFwWf1T3mmE20FL29QwdUx//obBuzWBthV57xrrKzxtnWpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4gXCSU7FIn7a6X9oZCO+CKbdPOtXL+j0YmfWXsp7q0=;
 b=o8udF1OXKkvu1GgTN0IBZNNC3j7wCYJZCPhMN9TGF4IILOz9Zy9zV2L9Lg8QYmKdsfajYJakFAt/VL1whbUUnoBXEA7V2ssVHYZ/u1KXXS8ysFFSM5b8BMch6Ati5NnvFUcNzov2HEqB1XBwVh1FIjFczapuVAGaf0azAQYDN6mC6klF/raevhd4Lyv+46I3gI44+Vi1j3R1vo76R2h2bGtQsZpGJaFjFrnb18D9ipZNBze4m1UF6vqIu96ex7rtUqh8Ts3ZYBxV5Oy+87HYK4y/VX30GBz+aFEoPr7sKaCwmxN/nKqrW+baqldIMO+ta/f4t1aZ6+FkFZiZ7Dti8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4gXCSU7FIn7a6X9oZCO+CKbdPOtXL+j0YmfWXsp7q0=;
 b=lNXjtpAzj7HrQMqoowMAC6MxWclk/liyXH+jNg+yCFbmwAgl6W0Cuy+t3EUZoFugBApcRqS1N96lQn4xPBE5WwllFJ8w/+zOLpRtZIEnFsyacblVl2vON3IAOHpvnCT5dAfqUCENyfLFISU/hhDqppGDiaUz3YN1cfe2KRTiQLQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by VI0PR04MB12661.eurprd04.prod.outlook.com (2603:10a6:800:346::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 12:29:26 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 12:29:26 +0000
Message-ID: <4e78b39f-d5dd-426d-b9d1-9cd6911acc22@cherry.de>
Date: Thu, 19 Nov 2026 13:29:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH yocto-docs v2] dev-manual: Document
 yocto-check-layer --run-tests
To: otavio.salvador@gmail.com, docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
References: <20261118231326.3121089-1-otavio@ossystems.com.br>
 <20261119122700.1695957-1-otavio@ossystems.tech>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261119122700.1695957-1-otavio@ossystems.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0116.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:350::14) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|VI0PR04MB12661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f781ab1-fef0-4dc2-6a60-08df4638bfb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|23010399003|366016|10067099003|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 9y5PqO/yq/B7FZj3FZxQBaOFv1cqsTzDKg4x0GxCRy+tWPQD6qmfA+A4r/zB5vM1r3YUkwYbJsHcR5q1qq4T0CakuUexOXk+SM1GEdDITSLpjwKiOg9MElFPPLvJgxO6nxRGYimsxTqF6A9mOwBRxHqTyVFpTfgrFBqVNSll5fVVpNBIGzGZz8VQ0Bjo9GUdjRjtHlc4Bvzuu2lWknX71K8irm82cLVchQPo/EFF6DH2LE63wnmyg7PO80NzWQH58EQmrQO8rGBNC+YfjyrD29W0Kmc8foSRDPUz1Kd6g/l41kq1x93UC5RNwEbgYcxPr+DqNFDYpmBZ4YwSZL6O3TrEFsluGXNJ6NnI4N13ti05GjQfMzljcXZNWafRS0bgswcQHlLjSM5oQY5uidIdNzDWDLiJjjv3T211TdN8HL8DTL2sw8gdeQUn1UKc48tCcUKyzwxM3YdkfTOZHlaUXciiCqzlD9YjtOep29dGYRH6UEFFlPPh8aaxuGFmnqMvKoFNkg3tP7jpeYD2uwhBcUPfiOR+4nXRHfi05nqGl9mdA1+SNyjoz5IuYfYTySo2lkJx0d45uCzsygQLS8R6IFLCEISLBWma9CV2uwjytFgjB35Shyz3D6njXBKIkziRw122FAYzdpGVUgPmr1AoGgqZAeLrHzOqAqdmA5Iq26Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVgveGlocVJOZEQySVMwWHl1SFBaZWtTQWU1ZmM4RzQzUktvV1ZTTFp2TE5a?=
 =?utf-8?B?TUt1YW1jMkpiTDNvd1hjUVJVNERVUStLak9kb1BuZDFWZnI4L1VHMThORi94?=
 =?utf-8?B?ekNaZUdVYjNXcFE0N3RneitaSk5leG9UdDJSaWtReDRab3ZGcHR1eUlYdEFT?=
 =?utf-8?B?d0hsOTNDcHFBL1A3b29iRkNWS0V3SlNiYU9PZlIvcUQ2VUlsSnR2L1ljVnF5?=
 =?utf-8?B?N0VaV0JTblU4VGd1V2FDUkJBZjM2YjJLK1FXMEFob24yc1pEOWVYOGNkcncw?=
 =?utf-8?B?Tk15dXJ5bDZMRHhHVk56OHcxOWwyV0ZXRzhGWXRXQzFRTm9TaXVJZFBUR2pX?=
 =?utf-8?B?REhXV2w2TnQrbnZGcnRHRVpQNkdjREV3N3Y5STFMMFFiN2dTVDFIaWZTV3pr?=
 =?utf-8?B?Qis0ZnJCcjFJR3RRaW9Fd0piVnlTYWZramtrOUJVblR2TlhpeDlPN1daNnVU?=
 =?utf-8?B?VFJud2hDbWtOdzhVS0szZ0FuT1NhSnZ6dGxIVnNGeFVkdlBpeHB5ZlFMb1ZS?=
 =?utf-8?B?dkFXZ3UxV0FWVlQvdUluaThuWlRuTlp5RE9WeExwT20rcjlhL082UjJFUXRv?=
 =?utf-8?B?YnBxRlB4UUc5L2poZkhMTm9kd1dJeDF1L29WbSt1cjBwbG02bDI0ZnhqZG41?=
 =?utf-8?B?amc5VTlLMUI2d2NYRE1kS1hzZVgrUDFPOW0yd3hSM3pjY1RIeEoyRldBTW11?=
 =?utf-8?B?MWg4dzJrdmZTZzdCZGE5NlFVRHgyRVJrVnVsMUhSRVByNmVXYXY5MVZNWHla?=
 =?utf-8?B?SmpEK1lwaVZQVFF2TEFWYnVSL20wdTF5NS9lakVyOXVDaHkxS2ZKR0hOQURk?=
 =?utf-8?B?NVh5WlBVdHB0MjhtdThvdi9XQlFobmJWbUE5Y0kwN2VvZ3I0Ri83bnJjTTNv?=
 =?utf-8?B?ekpkMGw2N2RpTmpzRDdkNE5OOXJDL3JMM2J1MTJ0SlM0eFpKUjNhUG90ZTNX?=
 =?utf-8?B?SFhhbXhkT25qYUJ2dklYSlJrQVdPVW9xV3NjRHY3WHpUemplY1NoTkU1UmdM?=
 =?utf-8?B?RGgvNWk5NU02MEtSd2FyWERiN0FqUlNhaWhLQkN0TnI4K240MjJkYk1mVFRP?=
 =?utf-8?B?VHpPZlFVMzEvem5QNEo5L3pOWGJaamkvd05ZcTdBeDMrM1ljSXFZUFdDa1N6?=
 =?utf-8?B?MVh5cTdFV0FQOHhEL0pSQ1VrYVhsejM2bEZHKzJJb2VweVRxVnk2QmJvc0Z5?=
 =?utf-8?B?b2l5ZGJFQ04xNm1SQi85ckhkaVZqVDJpQW80bmtETDBGaUs1bHdHbnExSmE2?=
 =?utf-8?B?dzBOMXl6SkpYcDJaQURhNXI0bGMzOXBwSzhTWnA0ZmQ5UjBVYWk0bFgxWGwr?=
 =?utf-8?B?TkRFeGdYZVNZMEU2WWhzOEZ1VEtLZm40WjdhWjJManlFN0N6TVREVXRLK292?=
 =?utf-8?B?blVhWitLazVhc3NpbWo4UWwzTXVYRFZjTXZWUks5b0EzaGdLN3ROTUE2KzJX?=
 =?utf-8?B?SXV4dEoxdllMV1NVTkRmejJabDVQc240QzVMVFZJZGlzeGllRks2T1RXNVE4?=
 =?utf-8?B?RWczVW9DRmdjNFpoZVMzUkdBZjJqZXFmSTFLdjZxWSsrdy9xL2tURGRFMmtW?=
 =?utf-8?B?TmJkME5JSkFiMjh2enc5dzNPQUFsVVd6aU5kQlhQL3JjRGE5WUpzNTdwSkUz?=
 =?utf-8?B?RXkrNjNZTkZUUUoveHJJNWR6dTJXRlhNNjJrdFVBUzNydTJidkU4QUQrekFI?=
 =?utf-8?B?NkF1TjJQY3M4ZG5LMkU0aC9rN2tKNGFqK2taUHJGZlppZ24rTlQxcSswaDVJ?=
 =?utf-8?B?V1JLUkw5VUVaOHBIb3NWTkY3bER1cjFKcU1VWnl5am84c3E0VmN6NGxOenZp?=
 =?utf-8?B?VjFUK2FwVkdKVTJWcFVScUxQNEE1eXpXWEExV0lpNjNjSWpNRzQzSDZ6MTQ2?=
 =?utf-8?B?aGVwRllPcHJFVEtKZEZYRkJEZW1vRkQzTGZDQTVSTktaYWdkMmRKK3BTYlV5?=
 =?utf-8?B?Q04xVmd6YmYvZXNjTkNaaEc1NVhlaHZWREpZdnRaSSs1aUhKcWZ3LzZCRGpM?=
 =?utf-8?B?T3d3eTBuZmlxbS9US3JUZmVuOUZIVDNFdHJzVUx0YWx3V0hYdWdXOTY2TzVD?=
 =?utf-8?B?UHRuczNiWDR6RytHc2p6TnU2TFpDZkM0OVptOE9zamNQTlJhNXI3Mk1PeGp3?=
 =?utf-8?B?dlRKU2hrT0tIUWZnTFFLMDBWdFl3bllucWJlTnk0N1V3Q1VmL1pQWVMzVXNi?=
 =?utf-8?B?RUJ0SU54M3dDWW82dkFJbCtLcllaWkpLM2I4R3ZoY05sWklSR3c0VERRbytp?=
 =?utf-8?B?c1YySThqTjBiNlRvUXloWlM3NHU0aUx2Q2p3VVNuV1V2VFhhcE12YW14Wjhy?=
 =?utf-8?B?TTFDQXdlVFFKY2dFSU9TMHQvbTdJc3BsTW5ucm43ak1ZcUE3QjRNRTQvRyt0?=
 =?utf-8?Q?/p9+ltaSb2h2w0VIxItUD+hasuHxPJT4aNcT59n98WVNt?=
X-MS-Exchange-AntiSpam-MessageData-1: s5hy2tQfWw34/wRCd8cA4slLAdu5zJXU5o4=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f781ab1-fef0-4dc2-6a60-08df4638bfb6
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:29:26.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ernDTyQztDO7CZ5+sCXPCGT8+RXaCAOU3Ni/CrnC+fVrySd1UOdKHsdtUoeFHIPcd0VxGGfIrOGHKUpK7z1T1w5S5EWYE+Z+EIIU1IsKzTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12661
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2026 12:29:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10800

Hi Otavio,

On 11/19/26 1:27 PM, Otavio Salvador via docs wrote:
> [You don't often get email from otavio.salvador=gmail.com@lists.yoctoproject.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> yocto-check-layer can now run a subset of its tests with --run-tests,
> for example to split a long check of a BSP layer over several runs.
> Document the option, and that a PASS from such a run doesn't make a
> layer Yocto Project Compatible: that needs a single run with all the
> tests and, for a BSP layer, all its machines.
> 
> AI-Generated: Claude Code, Opus 5.5
> Signed-off-by: Otavio Salvador <otavio@ossystems.tech>
> ---
> Changes in v2:
> - Use the same address for the author and the Signed-off-by.
> 
>   documentation/dev-manual/layers.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 5c8bf32b4..5a6577fd1 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -405,6 +405,19 @@ argument should be passed as part of the command::
>   These machines are the ones present in your BSP layer, in the ``conf/machine/``
>   directory.
> 
> +To run only some of the tests, for example to split a long check over
> +several runs, pass their names to the ``--run-tests`` argument, as
> +``<module>[.<class>[.<name>]]``::
> +
> +   $ source oe-init-build-env
> +   $ yocto-check-layer --run-tests bsp --machines <machine1> <machine2> ... -- your_layer_directory
> +

Can you provide a more useful example where module.class.name, which you 
alluded to just before the code block, is used and potentially even link 
to the source code of the tests that are then run?

Cheers,
Quentin
