Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF26D2FEE6
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:58:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13468.1769608687104624804
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 05:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bHKuTgIK;
 spf=pass (domain: cherry.de, ip: 40.107.130.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoW2VD1Sz4OVyBR/xQ+lu17diVpsdxSNAcIJ21wEtGPeiyisfeyqVyDO6ydQlQNRLvj6kjjCqWtU1tEIzuIbctTmLZU6AZ2sFnqlVLzqrMNN3PmL3Ic2Da/u9w24uVRvZTGaBfVNjltV2D3+7ksG/9fm+CfVj4esF/8QAKfnmAHrMghwODoLHLVImh/IenbPaiV0pxYclmZPNokTbwCLvUl/jq75QDgQ+8Ao5a66nOEGQe7aSo4UZJYjMOiCEPeQjUKxgcj9BUVPweSMLYer+oSgUe01O6P5hs5sBPT0uFXo6otup+QjwqlPeby+FWfVcf9/MEFKBgE8LTrTUA7VDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G7so8BP19hoM7e14rgTnTlZKJYXJSRkeTQ5YB4e1k8=;
 b=lN34Gm7+VRTAecHYAhbiazjr/oPQkBnMN76Wr9x6b4N2cQQiVpBfgEeUH+rEwu60gnS1vfKumE7k5rJl9ZXXGHfmHg2UrQs/eETBvFka0c+WIidLo3BXndllzKESZdaf0mgTnyfv1HHJ5ND4nMEC/BjQU22EsgZ+fOj6HDkvJqHKBqOwwwYGAWH1lPzYhz5Otymhh54wSzaUSeb4+McWS/E+EzIRakRTR0QNwO4diOAga0VCFVfIL3ThS2NEkf8JxDq6fOpfy5HRUgmxC0XgkYLSOAKAtRm+WqDmfnTVMGTSfptcg3s6poDc5BlYj3vc06K1/3kwoOQg6oBz/ciddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G7so8BP19hoM7e14rgTnTlZKJYXJSRkeTQ5YB4e1k8=;
 b=bHKuTgIKAK0Mec0thVvq5ZxwEhMCVf8hkfbK4i7f35beK4v9bgj78DjuuJMoncQsSpMnxYASkZKIn1r0wmq+msnIvYcUnakZYuAKJ3a1m9GPwFqmKl1ojbiKjLj9E/Vx51ZnfJ6siEz9di+PXtNZhb9AoPyHHynF71Z2Z/Vd9zQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 13:58:02 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:58:02 +0000
Message-ID: <a8a210fd-1baf-446d-9659-ca2207118022@cherry.de>
Date: Wed, 28 Jan 2026 14:57:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 40/56] dev-manual/licenses.rst: instruct to use
 git-archive instead of removing .git
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-40-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-40-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VE1PR04MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac979f8-69b9-41cc-a44d-08de5e754065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDZvdjg1WlA2Rzd6TUhybG1IcHZMUWdYRTdBVjFRVnM1cnB4UHc1bkFFb0RV?=
 =?utf-8?B?REgvcENqTU1pc1Zxd1BrRk5Na3pQOFQxZEdCQWNiL2ZyWGJRK2lJWmxPMFBT?=
 =?utf-8?B?NlFlYzdoWlVydG1BTUoxLzVTZ1hNZ0dZZFpFMXlwaEVqb2NzV2w0VWYvVHd3?=
 =?utf-8?B?R0ozeHJYSmFxL0RndjE4VVhzZFdpN1hySUNwSUdqVWJiRTRndE5NQ21jcHVB?=
 =?utf-8?B?Z0Q2TDJQWUpyblpta3lIby9tM3FVZklPOUkvL0VJQWdnMmxuU2hBQkRLOG4z?=
 =?utf-8?B?bjZOcTZvM0VQSGNQZE4yZWt6K0d4U2JKTWNmbFhJNko0RXh6SUhjMlNBb2lZ?=
 =?utf-8?B?UEVIVDczdjNGYUhkRFVKc3grWGVoUnhDd1ZYVlNWWXpiTi9CeTAxRzdBUndv?=
 =?utf-8?B?ZDltZkwrb3hYWDFBR1JjdjEyNDZmRzQ4cTlLRjA0cXZ6RWhGdmJvQ1k5c1FE?=
 =?utf-8?B?TGVKQit1cWcyeFNxYnFkZ2thMG5OaTNYcXoycTRCbXdaaXhBeVdoR2RWc3Br?=
 =?utf-8?B?ZCt6aUZkZFMxcWt0eUlBVWxydWF0VUZkaGdOK2tPVTRGbEpLbllraDRJVlF5?=
 =?utf-8?B?ZE1pRldrcmdhNlZxZ3JoaFp4VUZZL2liZVdGZm9qTlIzTUQwUjI4eFUwWDh5?=
 =?utf-8?B?M2dlUzBsTGdmU3dYNFhRMEFSeVd0cDRadXR4TGk5R2FSYlhBcHFoKzRlS0Jy?=
 =?utf-8?B?QlhkT1IxR0gyUFNiRDhmZnVBNG9vQ2YwUTRCNHFVWklZV2duN0lFL3pTNXZH?=
 =?utf-8?B?WHRtMmhnTEl4aWZtZmdzclUyTWZEVlFhTUJNMCtrWHVublpmM2VTVGJ3bHUw?=
 =?utf-8?B?cEFBZEpyRk1QdWNCRnFkQkhVVGFtNk9YQU1LbFZXMzZYTjBEUHVKYjhGb3dJ?=
 =?utf-8?B?YnNEUHVzWnBZdkhjMjkwZHdlMXRnUy9kSmYvWURXaklQWUQyUnExeDBPTHQ3?=
 =?utf-8?B?Y2g3SmU2dnlpNW9hTW1SaWFEQU5saGNUUXdFa04veExMdzhkR256Z1VwSnpH?=
 =?utf-8?B?Y1pkQUdhQkQzWG1JMW1zVjFUZFJwazlkN2F6YjlqbFcxcWlZd3I2Q0R2b2pJ?=
 =?utf-8?B?djBUVkFhcWo2THR4MjJJOEljdll0eGRTTkwrV2ozdWJiV00yeDJ5V0NqY1VR?=
 =?utf-8?B?SE5wZTE3MXV4Q0RCOTBTR2pUaFJvVHBiS3BrVFUwUC90Z3ZkallSdDVWOTZm?=
 =?utf-8?B?VS9UTy9zTUtaaGI1NnpqaVJ0Szc2aHZHTnp1YUVLamlpK2JYYWVIakNwS20r?=
 =?utf-8?B?UDlYYTFNZnIvaTUzcjdSUFlScDNVNVk5NE1ZOE5aODhHVTZSaVM4NXlicThR?=
 =?utf-8?B?WlR5YkpaU2RVUVZ6MUhPYkt2OGlrYnJCYkJ1L0NEaTJoOVoxMzlONE1pczJo?=
 =?utf-8?B?MGp3SEpaOFhhejBDRmt0YXVhZXVGOFJhV2lRbmZsTm9CMnJSamlzcURRTGw0?=
 =?utf-8?B?dWdsTzFqcGhEaTJhV2pXeDBuOW9BYnArZmEzbkl3YjU1bUpaMmpWaE1KOUdz?=
 =?utf-8?B?ZVdvekxtdGhIMEEzWUpyUGJ6SXNrVVN5Wmx1OWdIbWhoWTl5VHZYcFI0b29C?=
 =?utf-8?B?MlpaODJFMWJtQjR5eWgrcElOTzBtOXJBeFlGQ0ROVlpWL0dXUCs3MUI0L2dV?=
 =?utf-8?B?TmliSWpLT1BsSmgwbThHV2RCdTZGeFJvQVZ6OVlDQ2ZCS3ZzcitDd1NETjcv?=
 =?utf-8?B?SWs5NFJWM1lhTkxtTGpqakI0RmhBcmxhMXludnVDUXZDcTBtSmdNSktFQUMx?=
 =?utf-8?B?TFZjZjV3RlNzc0FHUW5wTFZOUDc4YW4zNnhUNk5UY1QrQ0VkM01ETStTMEkx?=
 =?utf-8?B?Sk9vajc4SDhBSExYWGFucTJmR1JsdDJSSUh5dWt3b0ZLYUI3SExscUVxWUQ3?=
 =?utf-8?B?ekw3U2RMZ3VZUVpNcW9VMHpTU2FiSUttOG0veVVoWUxLelBLeWllV3h3M0F2?=
 =?utf-8?B?TldBNERrYjhyb05xSTRzRCtJTVQ1Y1JNRG9FWGIwWXpNZSsyYnRTYnlyd0RX?=
 =?utf-8?B?eEQyMVpqZC9xMkp4Mis3b3BvbEQ1bHVFRDY4VHhLVU1sWkpJVlYwUGdLajRk?=
 =?utf-8?B?Qy8xQ0NNdFB2aStOVmJzNnIyNWt2NUZnV2dSaEV0bzY3OXN1QkFIeTN4bGJS?=
 =?utf-8?Q?YrcU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGFVbzZXQ0Y2Q0tvVE9ONUxOWkVIYy9QN255RllWSlVUbW5jZzh6aTJBeWZK?=
 =?utf-8?B?MThLMEo2b1Y3VlZkZXpQUSt4VCs0MmRvcy9uNDZKenN6Wm12a3lURTU0MXdE?=
 =?utf-8?B?SXhZaTcxSzk5b1BVUDErWVpCa3RWdDRqMjBSRGNRSVBUUTFrMFpUaVBPemIr?=
 =?utf-8?B?dlh5WC8yZU9KMWpNeVByYmVJcGpkWElIZkIvaDdCMW14ekphQ1ZxWEYyclds?=
 =?utf-8?B?ZkZDOFN0WGkvaHFnUW12SVdZTnhVTWJUUkNkN3NLSXZmMXdWZTlkM0VYTVNl?=
 =?utf-8?B?WE0xRklpUmRKaUlPbE5vdHE2Q1lVZ0x5NnRzMFNDdVVNNlE5Q3cweHdoSXdz?=
 =?utf-8?B?bTZYVmZXVzRSUWk1R21DbU53azk0Mmk2UlVsd2ltRmZLc005RG5CVi81RFNK?=
 =?utf-8?B?cnRORE5yR3RzdnpIRVk1NisralE2ejdWOHk1a04yVUJzQWFqTmxMZkJwbHRh?=
 =?utf-8?B?eEhkd21SbldXclJOd2JUdFBQQTRJMXRZNWd1VVJoS3djZy9RTzc5R2hsdmVJ?=
 =?utf-8?B?QmN1cnl3Z0pZTlJMTDVBU05MaTh6OHRCODZzREN6dWdlc05GTk5ESFBQMFpN?=
 =?utf-8?B?T2ZoY2ZvQ2dOdE84bWxjSmFlLzEvODZXRGZzV2xHaWoxNzlTaWNxTjM4bXNJ?=
 =?utf-8?B?THVKbGZJTHdldGxhQzRsNXV6d1kyNVVMY29POWRNRklmNkw1MXlKVXZ2QTVN?=
 =?utf-8?B?NGtBUnJBSVFtUjJZR2ZkQUtOZkRCaENTMzVmZ25BQjlCc0RJRk52NG1EMUdo?=
 =?utf-8?B?Nlk1RUVmRnhrbHg4NFlQR3dOM1FLR0FNa3JrSG85MWUyUFFwdjcwYnowRHRO?=
 =?utf-8?B?WEM3eUNTcXBmV3VLV0VWRFB6MVB2SjdEdTNPQWZXdk1MaFY4amVwZGlaSXdF?=
 =?utf-8?B?MEhNdkJPSTFOc1I2Tlk3MHMrZnJzRUkrVVVZWWkya0RFQ2xWenpLSTRiOGpj?=
 =?utf-8?B?ZnhRQkJsQzVBOHVLQW1TZnYvNGZOSml5NEJTVkMrcTlRS05WUy9oWlgrN1Jz?=
 =?utf-8?B?bjRsZVFuWGRDalhvb1ZVOVczSGh1akMwbWNVQXA5K0p3aUVyWGtVb28yRHEw?=
 =?utf-8?B?ZzFxTWxPeXRDYjhxTXlpNE15VWxzREtaZ3lBTktJWW9WbzlVMnZoTG92MTZO?=
 =?utf-8?B?NTdPcVZNMWdzc1NGQjZ1T0ZIYnBqai82c25HMmptbEc1VzFvWFByaEcwclJk?=
 =?utf-8?B?SFI1ZlNOMUt0NlBTQXEyTGRQWHBOa29YZkM0d2hvVU1aUklUblBGekliQldz?=
 =?utf-8?B?cXJxZ0hBaUZTd0pCU2RaQzQ1dUJUSUNVZXNzS20zZE5KOFkvanVOMFRvM3Z4?=
 =?utf-8?B?WnFjanBQWHNUM2RNbWhZOVhhOFFHeDJxMTc1VG1DczRQRDNaam9IS3J5MUw4?=
 =?utf-8?B?cTE3RndCaE4yT2dFbWF4SVhEQ3NZdFRCM1ZvM2NRWlpsZWVPUlVVWFBUOGJq?=
 =?utf-8?B?Yzg0TitTeExyVFp5VFBIQWVpRmJBeXdQQ2o2S3dBNGIwcUpnM0hQUFlUUjVz?=
 =?utf-8?B?UXdJY0dQUHpmSkUwblVOdVhIMXNvS3JMZURzbEJ5aUNLdjJWMkF4SXhUZ01G?=
 =?utf-8?B?RnpGYlhlb2ExZm1FcThBN21qcUlkaFFNVnhsSlMvUHZ2c05kWThYMmVrWHFt?=
 =?utf-8?B?Q0h0Mm5ySWUyNWtqaExKNDdCQ0gxSUEvaXNEcnhTUHppM1k0TnAzSmorSFBB?=
 =?utf-8?B?NkV4SGRGM292Q3dYN3VUeVFqZU04eFVONXFkRnhOenlTZHQxSnNIUk5icmlX?=
 =?utf-8?B?azNmWk4xQ2ZKUjFCUVZKbVdueFVZQzc2d1Q4eGh6QVdqWndWc3p5UEx3WU9C?=
 =?utf-8?B?MzZod0k4a1U3SHB6d2diTkYzcldoanVlR1ErZDg1RElpN2kzbWZLbzNXbXZR?=
 =?utf-8?B?Qk1OOXpjY29IOGNrb1dad3hzZnNFUmFiS0dCQUZaYXZwNWdDK05aODk4WWly?=
 =?utf-8?B?bU13b0w0bllubXJ4c3o0THZ1b2J6aW9JR1NCbkFJS3RodXFuNCtsa0ZtcDJM?=
 =?utf-8?B?SVZNOGROczNseDZmZWJ1ak5kRkVGZmQyR1JIaFBUcWxKa21QNTNneXlFNHVa?=
 =?utf-8?B?eWlMN0RlYm9pR2RHdXAxZlR6YlFRdmd4WEovMHJ1T0h5ZFRsSTR1UXdSa2tv?=
 =?utf-8?B?eloya0xkSTBucXM0bmZCRzZLbncrNkpjWVErZUl0VVlraUlPWnRGYkdJc0tM?=
 =?utf-8?B?TDRXVi84bTdjTHZLeUVZSWpHVis5UDJrSGppVXhRbkJaVis5MU9mVTlXYnZi?=
 =?utf-8?B?KzA4N29WUWduZWc2alUwR1MybDlrRXRiNmVDUzJwTzdmNzMzS3R1Qi9Vb3Rv?=
 =?utf-8?B?Mk00OXdUZ09zcC95d21qNFJ1dW9nNjFBQUo4ZTJKekxGcVdLUk1QQ2pLRW5M?=
 =?utf-8?Q?Ci/mc8cYOU5JUddT9IlOild7V86YzN9vbtUKB?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac979f8-69b9-41cc-a44d-08de5e754065
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:58:01.9343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KcYu0YHKQ4937MOs6UKG4TCcb+I0s69fqYY48xBRaae9Nb8+W0WIaMmSpp6XWVYR8HYR9vzr1Pbwa5D9S6emA0/48C4VZpgm2HRqekYGnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 13:58:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8765

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard wrote:
> Removing .git directories is destructive. Instruct to use git archive
> instead.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

