Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDF9CFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:31:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16045.1764336707027839995
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 05:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=iukXsfsR;
 spf=pass (domain: cherry.de, ip: 40.107.130.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWd3MH2PvBqPrSnKLbU0RfpoVU2/8P0M3G7h5tdyHrROncIFmvWm8uCTYUPOkvNaeQ14Fz7MVs4nkx5fb3t/A4tsQobIsor6XD1p+ZDMwXcsldFXXndCNhzldP/7ZS2Gyf0/zBUSd/9k1rzVbIZyyFnpbORSCkUCdeBJg+FZ7UTn8XEwwEwjnKRNcMFqy+JKNA8Ixwv7fronZASdM9ZTSTjIMkSxEVN54vyBXRxCRT4/eSvvEeivkJBoxkoVR1ldyJLJqryoyAlAz577XdBvkoaQQsCOASXSCc10odWc0cd843V85z0zO3dOOTlH0CZcd87sdRkrfX15B9cJe36DOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lh/ORGEfEqoKwOUdQZK13u84SfMVHLdfXXcoFpSBMSE=;
 b=cPaLBLNmSdVARYwamG/Y7Kvm7MQNijW2uIJ4jGIgqWXq+GrzRhKGAJQIpV0AnXWnpszGyEreyZXN0ue0VGiXD7qvcRejPQMLUOX1e/m28TsNHxmQObl0ijrLsNzscMJQI5aLZpISZeyg7TZvsKsK95f37VMQMz7K4BWwBiClHAgEjyHqGd/kBc39EDkwN+9AfY2T/kY0b3MoGOV82EpEFrUpb8o3wVVgdp61Vi66N+o/eSVQ36vq+Z9IWcX9fps6RYwlRWWpTQq6OK9eFztcjszGPkFdJdyLTdtXS9JEeJ+cA/1Qh12QZvd9wtpose52/DyGPs08E8BUuWKQTOcToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lh/ORGEfEqoKwOUdQZK13u84SfMVHLdfXXcoFpSBMSE=;
 b=iukXsfsR1wIDnyrIjhmRDtDsHe3H7M6sJiUX+WRcdQw7FG7TP71Si1RMUZzVI+ZtVWuOaThNupfaVh02zgFqnotXm3kwJnu46F2sTQDU0H72+aEwQLaSWj07bFxC2ZYrM+MhBw855JUkRZz3qSChZylZjCLM9vEZ28pO3r22RRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB11014.eurprd04.prod.outlook.com (2603:10a6:150:208::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 13:31:41 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 13:31:40 +0000
Message-ID: <83cdb96c-fbf6-4a5c-a2a7-97f748a3ba1b@cherry.de>
Date: Fri, 28 Nov 2025 14:30:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] brief-yoctoprojectqs/index.rst: switch shell
 block to to console lexer
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
 <20251127-bitbake-setup-updates-v1-3-75ac1e490a40@bootlin.com>
 <1d128f7c-1af4-4e11-9ce9-b72cecff0485@cherry.de>
 <DEKCQCLV0UHY.2TD6EXECC6FA6@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DEKCQCLV0UHY.2TD6EXECC6FA6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB11014:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e769618-a0bb-4189-1d56-08de2e8276cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?LzZBYjJDcWFkd2hwamNYVWlrYi9QL2J4akVtalJQZHU2SWlDQW90TEpubWJX?=
 =?utf-8?B?R2x6S3hQOWh4UWFJQnRCSGpLV0VERWpQaE9IREwwRURtUDFTZkdXaEpYR0tT?=
 =?utf-8?B?ZHJ5cExmcVVkaWljWEcvTjJySWpETTBhKzNUTHZLL20wVVdJNlpoZUxKS1Ru?=
 =?utf-8?B?NGtWSU5YY0pycEx2NHdjOTYxdnNpM1ZQZ0J3QmVlaDdjUWl4OERVUlVHZStV?=
 =?utf-8?B?eExqRVAzTlIvV2hRRmJQczhYK2UyRld2UkV1Q3F1bkoyTmowK0oxY25vUmlu?=
 =?utf-8?B?cmJsYU41d3dYYUYxaFpnM3BqaDRCRW0xM1Nra3Jvd1hZczV1dzZ4NVZqaUhm?=
 =?utf-8?B?OHUzRWdON1pITjlrNVZhdnR4N29SanlRemRJNk1pWnlGM2dINy9mY1V0MTBa?=
 =?utf-8?B?MlJQYWtqQW9iT3lpZW56Z0h4NkVlbzBuRDM1UGk4VFJlc1BxMzhmaG9TNUtL?=
 =?utf-8?B?QTlqV1FyY2NRUWFzVzB1dmFwWU03Y0RNV2VydWVUaHlxSC9INlNFenVOd0Uz?=
 =?utf-8?B?cnlJRmg0aEpnVEhlYjk4UGZMUnFSeG40WDFNaXZRbFFHenpnRVhDUG5JT28x?=
 =?utf-8?B?cEJDMTZyRi95amRldWdOeVhnYXJ2YnZjMmtoSFJnSEFyQ3BOWHdaaFJ0d09V?=
 =?utf-8?B?ODlxdkNrVmVIQVZqWDNPVjVlWlcrVTNLVjVlTW9PRCttdzM1YTM0WnJEclZC?=
 =?utf-8?B?c2MwSU5telZrVDZDYWVIL0VBaGdNYTJ6RG5tU0lVdnUvUHRqYlJPNUlDZEJU?=
 =?utf-8?B?M3NWK0NLMlVNZzkvL3dDcFVUVVlxVE5YQ0dDeHJBTFFHeTNJQkZPTFNEdFFN?=
 =?utf-8?B?dWwwK2x3ekx6ZTNNN1ljZUM4QnMycmNZZzhLdWsvak1RaDBWaGJQQkJ4RmRC?=
 =?utf-8?B?Z2pVTCtRRVZ6WXRkQVpSdU4xTzZVTXZTdWx1M1lROTZBMTBKOXhlY2gwb2hx?=
 =?utf-8?B?Znh3YzFhSjEvY1lVQVlCd1UxZ3MzYW00YjFFUzQzYXZxY08wNllhR2NYZVZh?=
 =?utf-8?B?WE4zVVJqUTFRRHZKNlJRVU9QSnFVZVBPR3RSNzJWSE1VRFNoQThvZ3Jhb3g1?=
 =?utf-8?B?MmIrNDh5aGdTODFpdHc1N1gwckRFcVA0U1g2WVQ4VnJ1YnNtK2EyUTdxYXpq?=
 =?utf-8?B?OTNXcWZmb2FnMkl5K2V2Z1RwQWVTTUs5V0R6Tks2MEJiTFBJWjJEQUF6NllZ?=
 =?utf-8?B?VGR3K3Zqak5xRlVLV1lCVGt1RVBWNUNtNHBGZUtpeUtQNUJtaHNDYVdjR0VW?=
 =?utf-8?B?aXNNNUNqSW4wWFhWOTV3WGM0Tno5anZDcHp2T3A1eEFTak9SNGdCRDhrbWhM?=
 =?utf-8?B?TTNEUmVENmVhZkhjMmdsMW1nTWt5U0M2M29XOTNsS1JOanVUSTJ2NUhNZXdp?=
 =?utf-8?B?bUV6UCszcEUwZVFnQXlkWWNBeGhaMjA1VTc4dWREOVBMQSsxcUo0NEZxNW50?=
 =?utf-8?B?U1J2OEFMSThxdWt1YVJrQTRWY0ZaWHV3ejU4SzZGWXRlSC9LRzkycFAxNkFR?=
 =?utf-8?B?UGlQb21nRDVMdG93ekpEOVdjS0hrVXp5S3EyQlg4WHNyMjFIK2FlcHc3dkZy?=
 =?utf-8?B?bnZzdkFMTlFpNURpWXRTQzg1aUJUdUpXMG8yY2pLNUxzN1lZK2tMZnlLNVRD?=
 =?utf-8?B?ZnFnM1NIN0I5d3gxWEhRTUhTT0F5SEpOT2QzbXVVQzJaWkFodHM4VFNpRVhD?=
 =?utf-8?B?eEFFNDJ1d0Uya1FONE15Zi8zYXo2OWorYS9IczZkMlE1bVYvZGRqWnJTVnhk?=
 =?utf-8?B?U1FocmxPZEN0ZVpYM2R5SEpPdUlZb1NPUGxON2VpeHBaaEE4cy9nUEwvcWk0?=
 =?utf-8?B?aFdyOFMxdEpwTGsyems2TlplK3ZucUpFY2FieFV4RDhTVXI3MTRRRC9LSWNq?=
 =?utf-8?B?Y2tWTGVKS09RcXZ6OWRsTlAxZWEzdmU5RnFBMG1CSEx2YXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXN5TDkzcEF4cTVaU2taeDBKUUY3L3RBbDVPQUZEWXcvV0R2Q1JLZ2lVQTB5?=
 =?utf-8?B?L3RwS1RyNUIxenVOekUwc3p0N1hrTm50VmhQeERGM3hjQmowUm5XRnNrSTdD?=
 =?utf-8?B?YWVGaUlzN2RIc29iRC9JK3gvWnRITmMzZHRsZ2psWm8yOXU2TkhNdmhCbGxV?=
 =?utf-8?B?QUttd09xUXFVMlN2RWVGdEFTbE5BNVpTWjJ0dmhVK0M1cWVMYUdTalo3K2lp?=
 =?utf-8?B?aW1lTThpWlZHMnYxVGtlVDVCTTV4R0JRWXZNcWNMeEdzSmlIY0s5VzlCQ1dO?=
 =?utf-8?B?MWkrbGI1cWI0SHhhblZWNGtpSHJuNWFuZlNJejkwTXZPaFh6VUh5enY2NmdI?=
 =?utf-8?B?YUU3dHNQSS9qRXh5YUl2OW9OUk4vMlJ4N2N5dmhDSEtVNXhNOUE5TXpJUDJp?=
 =?utf-8?B?ZnFEanl4ZDlXNFRYK0ovT2Q0TituMG5zazN3ZWZGQ1dMMHJyU0NQVjYvUUhq?=
 =?utf-8?B?TlRKZ2lpbm10N2RNZDRLcEFSR1hhbjYzV1VuUWxPQjlyTW1TdHAwSW5SUnVJ?=
 =?utf-8?B?aDUrcXlVeUlCalBpNjRBcFAxTWV1ODdLeFBWZWcyOVZyN2RuNmVhbWI3c2J4?=
 =?utf-8?B?RWR1T0orUEFXVEFHUDZOc3ROUW9BWjliZ1VnTzB6ZUlzQllrMjU5NDV6Sm1h?=
 =?utf-8?B?Qi9zY3M5S3J3dUZxL0NuWFJWanRLN3dhQkdad0d6a1VSbzZ3Rjh5Y1ZLRWdU?=
 =?utf-8?B?Q0l2SCtSREJkUkZ6V2ZDcGNRR2JUQ0g3MTdLNUZLWm5oUUR5QytUNXpscTdq?=
 =?utf-8?B?K0NFVVhwb0ZNc3hoMUZPYkhvcTlDR3RLYldLa2U4QWRaV2NINi9ETWdSZ2Rv?=
 =?utf-8?B?djloQnJnSURUL2UrYkdvK0VScW40WmVsQXZEaDZYbWV5N1V4YUsyUU9KeW1D?=
 =?utf-8?B?VUk5K2hCaTZ0YjVZTVlQYjJjM2lucUZuWndKbW1TankzaWZOem9FN3BGMEtk?=
 =?utf-8?B?OER2em1PTDhVeFJDa3h3eVJNSzZDOE4vNjRpVXJlbWttTDREaW8rb2ZOQUdP?=
 =?utf-8?B?Y1hicFdSNnZwRDJKeXBaZTNrZWM2aHJQdjhjWDVMOVdDM3BKTk5IeVpMckpj?=
 =?utf-8?B?TzM1Y2JwditkWGZqRGZzSmM5aHRIUzVuTzlrTmNUbnRTRzh1eW5wdUFPajRZ?=
 =?utf-8?B?bDlyc0QxVFpGWENJT2hoeVZTZGE2THFMelB3RW5YMk5WTkk4SlhESUlUVko4?=
 =?utf-8?B?YnNiSkpxTmJxT0J2RzFtTkJUeUxRK3pJcEFYQ3d0SW1ZVmtBc1VzbGFjbzhU?=
 =?utf-8?B?ZTJlQjFheHZtTTcrcjZOUFUrZUoxbHlTT3RpU2NKa291M0tTenB3eGFwbldk?=
 =?utf-8?B?d1FWN2hrTzJ3T05vbDFkZTlZT05iUEc1bDlXWjRnWGMxeTZIT3JJOCt4Y09N?=
 =?utf-8?B?UWQ4SGVkZ3N2cmJUeW82aEhkRnc2cWpBVk5pczZuOW82VFMyUWJLVzV2MndP?=
 =?utf-8?B?c3NGYzUzemZWY3hOMWR5MXVwK2ZBa1BucC9OVkxlT2czYVkvdHZCakJQNytz?=
 =?utf-8?B?a1hmNVpFdFV1eDNjK0NtMVdNYnFENnhXMmxLeWVFRHUwRFpESFBLbmVaSkZk?=
 =?utf-8?B?Nzh0ODNzbDRqa2ZMYTJ2NFg5SWZ2TlgxbFBEVjUyeCtnckFTWjgySmVmM2VT?=
 =?utf-8?B?bW5Vbm1lZk9GS1FzMUd5VnlFU2JxQi9oUVJvSVNxN2RBY2N4YXlUcThMQktI?=
 =?utf-8?B?OFgrTHlSVUdmb1ZqcUozZmhhdlViWHN3NzBzaS9OeVhLdnJtTFBzakE1QXJk?=
 =?utf-8?B?N2xIdGpoWHFjT25PNW0xSSswR3JJeFlITXhkVndxYWlKNnRMOHI0MCtWWjls?=
 =?utf-8?B?aFNrRVNNdFk1djdTR2NmUWlqY3hwR0NJUXcyaTZRNmNGTUZYbUF1N2NNa3px?=
 =?utf-8?B?dEpaazVETzZVK1ZqemVBNVpaRnFUUkNCWmtaS2poNmlLZnFnQjlPM0lFem5z?=
 =?utf-8?B?WjQ4MkxnTVR6b3J6aG14akRWMG1hS3Q2cXJDTU9SNDNkTmJKMFVtSEFPeTFX?=
 =?utf-8?B?V2prdlBFVzUvbmoxeGtyRk1YcndldFZZalhlbzY3N29pbjlzaDErclRtUkt3?=
 =?utf-8?B?WC94eTZ1OVhWaVIvZ1pkckhaejI1ajJBM2JHVit0K1NqOENERys1Z1lmMnJN?=
 =?utf-8?B?a0tDRVdEQjhtVGdMMGV5V2lCYis0Mkd4eUdsQXVKRVRMUU9qcUtRNStxeTVa?=
 =?utf-8?Q?acTgnY61q73KI4npoW1EDGI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e769618-a0bb-4189-1d56-08de2e8276cf
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 13:31:40.8452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARdaBAxUYkkwPX8CYJ3frb3606DT1Hf9XapUByxRZV/ccpe0qr//qpDytPNxywZg/yWaoSsp4JxwWh/fM89yNROE/oXl+YNqG2pTSlek/U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11014
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 13:31:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8161

Hi Antonin,

On 11/28/25 2:11 PM, Antonin Godard wrote:
> Hi,
> 
> On Thu Nov 27, 2025 at 5:47 PM CET, Quentin Schulz via lists.yoctoproject.org wrote:
> [...]
>>>    #. Choose a configuration (for example, ``poky-master``):
>>>    
>>> -   .. code-block:: shell
>>> +   .. code-block:: console
>>>    
>>
>> Neither shell nor console. I would suggest to simply use a literal block
>> (::), c.f.
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#rst-literal-blocks
> 
> Thanks, I'll change that.
> 
> I just noticed but I think the default lexer for literal blocks is Python unless
> you explicitly set it to something else in the global configuration[1]. I think

Ah, and I had missed that. I changed it to shell for my company's user 
manuals but I didn't know it was Python by default (well some sort of 
Python).

> it makes sense to change it to "text" as the rendering looks odd in most places
> where it thinks it's Python code, whereas most of the time it's either text
> snippets or bitbake assignments.
> 
I would recommend picking a sensible default. Since there doesn't exist 
a BitBake lexer (and I don't see a MR for that in pygments) yet, I guess 
going for "text" or "none" will do. Good catch!

This though will get rid of highlights where it is (to me) somewhat 
useful, see most blocks in 
https://docs.yoctoproject.org/ref-manual/variables.html. Maybe it isn't 
*that* worth it. Up to you.

Cheers,
Quentin

