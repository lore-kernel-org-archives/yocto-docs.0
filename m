Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C99C021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:13:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.12])
 by mx.groups.io with SMTP id smtpd.web10.404.1740068026254742663
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 08:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KijCfvKP;
 spf=pass (domain: cherry.de, ip: 52.101.66.12, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4/STSvj5JZ4WOobEN2RNk2/kaPx/skZYOaEvHJBQNZn98bSQSSSqqMiQAV3nj9YkFFkGCmWNh278tIvFstEx9FPJz4LRlfdBdLJc253z7tFVd6grHKS24G85Susi5NvkJs0p6DuYdc606141LSsJBDpBsEF0OKKhSiT8wtWdYh3RkkqJapRZoza5RTceqiwikua3QvN/aLiNrG8Kijst98zEYBFfRfPXcae8FqOleGdIf4Bqssf8WF9K53wxyxFREcc40F4R2K6M8gMqcsj1Hp6cEeBFRjWK23xliwA1ANhEw9T2WRH4+AQ2LFWqAolrNnOBAvX0qq+Yuz2ni00pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYk8YcPG7oehlGEROxX2YszQg0YtS2G0jXRbuFatUDg=;
 b=iu1bRAMzbRb9Y+kh87SFR9R/UwyFwD5bQeeJK5GiEgMDsdSRSfyHZnIJ5LIQIf6NiCx1JA9hacj/5YsF6b8YWXXbDY425Xr+3mB2bBG0yPM6lgXilH2ci5KnzqAujgT5ZYetfD5ASSrleh8rmgq6GMroaoslFtYd6+f68ZP8XRmgoyfl0sj1aXgT6E4j7T809d0mgeaDkr+GVp2AUpF7M6eCDx6+jbD+TA1AYUKRnB4++UG1F1XfNMzL+zy0F83IdGAceA0fR7kYiWKvFi4cOFEP/7dKpCL1ss9jAiIB/2DODNXEATCJZMCJYWWdVzdA5Sfh41dEG6JVl80zPWfjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYk8YcPG7oehlGEROxX2YszQg0YtS2G0jXRbuFatUDg=;
 b=KijCfvKP9tvOxX2hDOkfWSfQwK+NnTaBqzf79pO/4EqmA1Raxe0cUN1BkaROG1HQpOV0FYhhepnGzTP38yTfOxOI5NMXZmzzUJeHOLLKEE7T/T8kIUZLez1Tuqq7oeMp0/wX1KolmHGiXJVIcsiO0Rvsf1aYvPj5RF+9Jh9ZTjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7412.eurprd04.prod.outlook.com (2603:10a6:20b:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 16:13:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 16:13:42 +0000
Message-ID: <b78094a9-4994-4f7d-a6c4-beca36cf652e@cherry.de>
Date: Thu, 20 Feb 2025 17:13:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/6] overview-manual: convert
 configuration-compile-autoreconf.png to svg
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-3-75d23b5e7a88@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250218-overview-figures-v1-3-75d23b5e7a88@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 817482d2-fa20-443b-ebad-08dd51c98b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T2pnNmlYamVnd2VIT2hkLzBoVHJoSGg0VVJVRVB6U2g3cnRhUzVVMm5NRHRz?=
 =?utf-8?B?UzROM3RwYU55TjJ1bXFvZFVEWFc4OFhuQXpiT2tCQ1JmbENSYk1wSThJNThV?=
 =?utf-8?B?Z3lnMkJFUzh5ZXE1ZGZHOHBPVUY1OERocm1EMXhiM0ROUHJyK3QzZVQrcDlX?=
 =?utf-8?B?N05qVFBNTi94UTg2bkUzaThMaVN5QWsxWnduOGtmYTg2N0J6UmFxR2NWSG95?=
 =?utf-8?B?QUVqenpKeml4bjY2UUhKa2lGSHhHbGozYjJ5UnhiK0JIY0lCYnlkNlB1RVFy?=
 =?utf-8?B?M2NJS1FlRTdLSGZVU0JWYWZBTTZLTnN5aGJrb2JrenlnRFJSV2RsWHB5Mlh5?=
 =?utf-8?B?V21uMmtOaVc3aklITmZCbDlNT24wN1cvdUJkbFRHMXRpRTJLYW9COXYyNFha?=
 =?utf-8?B?WUQxdlV5bVVKbUh6VDJMcmgzeWFTWEw4T2p6WUozaTlEc3hxVUdTM3luWkZG?=
 =?utf-8?B?c2F2NFAyVlRSQ3ZMRTBMZzltMXRDa0V0ZWNCSjNzbkRYUndDNCswL0dFZ1Yz?=
 =?utf-8?B?OFZyZnYvc2NLVmxCMEFIZnVNNTUvVDJnZ1I5M3BMNDBBT0lVM2Z3ZWF2NDRt?=
 =?utf-8?B?SGsvK3J1RXVrcHF3S2NEV05GVkZTaU56NTNRTWRSSEptUThKbTNkejUrSXJh?=
 =?utf-8?B?TDZJckJzcVMycXgwRjNUdHBUcnBHcE5Tc0NHTHJxbExsSndSbU9NU3hzcHVs?=
 =?utf-8?B?SUg2YTFZaHdHZllLb1FsWFhEaTBOSEtLZWRTcWRyUWNoV0FSVVZQQzN3Mm84?=
 =?utf-8?B?SEdtdjZUeW5qUTMrSEJMMlJ4M2xZU2RxTGxwZVY2OFlpUVM2T1V0SkZ6eGlU?=
 =?utf-8?B?cC9NYXlRc0l1ZHFFdmFJTUJ3cW5DK2pzdE1rRm1OOWZqQTYwRzg0TlBabkdE?=
 =?utf-8?B?YmFpWXNPd1Bid3V1VzdBMGM4M2RCdEhrWWNQQzFOK2oyZDg4MmoyNVRoTTZt?=
 =?utf-8?B?SFFVbzY1TkpwUmwzTmJ0QUNWWXhyM2ZkUFFLMUZnc2ZVRW1WQXBoTVkxMDc5?=
 =?utf-8?B?VWgrZ0tRbjdZZjRRakpsTWN6WTJKWlE3RGdYRnB4MVBPOTFxM255Nnl1TVRY?=
 =?utf-8?B?R2xyYmR1SkJZRHRRZjd4Vm1oaTdEQm1xQ1F0QTVTcllZMjhvaHIwV2dVcjFL?=
 =?utf-8?B?UUovNVZxMDdwVE5CMWdJMHRFVXI0Rmp6dGhmR1VrWmFZa2poQytwUWZyaUo0?=
 =?utf-8?B?bFZkT08vSWg3dmFyckFIQ3VoKzludURMUHBJbHZJWW9YaW1BVDh5RHVIaDUr?=
 =?utf-8?B?eUxBSmt1YXAydktKZHVPZEJWbUE0SmV0UTI5R3Mxb1JNQjBGRmw3N0N0V2l0?=
 =?utf-8?B?QzBvbnU1U3ZiN2dSNk9TWEdMOFNVQ0JCNUt2R0huQzc2eXZXK3YzOWNFMytB?=
 =?utf-8?B?ODdUaG5OM1pkR1IwZ0pDcU4rZ3djNnhoTkNQTXlrTE1tN3FCTFRmSmVYSlE0?=
 =?utf-8?B?UE5nUUR4b1NaSXFJMDJScEEzb0M0ZUFPaVA4NSswSHJ5VktLSGNpNlFrNG1h?=
 =?utf-8?B?VW9kTG9XdTRtdElRMVpvZ0ljYmFJVDEzVS9XWHh4T1N2QkxKOVU1a08wRHcv?=
 =?utf-8?B?VHQrK0Rla2xUN1lsZURNRTFtc2dxL1RENE1CZFdaVzY0ektKOWRWNW0zRFFR?=
 =?utf-8?B?cE8vbnV6NGJBK1FPK2RvVXh6WTA3RzlXRVh4WkpBWG44RFBDclY5aE1GSlhk?=
 =?utf-8?B?ZWxwK2x5VzF5amNMMTJtSWY5OUNidXVrbFR1bVg5dmJNSjA4T1JScFkrcEth?=
 =?utf-8?B?Q0gxb0xlT29PN1FNdzVPUzBEd3dTeERVNldrK1k5MjIvLzZBU1pHVUxCeFc5?=
 =?utf-8?B?ZnVuL0hWSTJhdEVYa2E5YlB1VmxmVFY0c2dhY2cvdDg1bXZLeGJBenpNRU41?=
 =?utf-8?Q?VRwt4JbZy6JXY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2hEdHcxOFkrT0gzWFowLy9Xc29iMDhJS01sbXNSQVptZkR4MzliZU5NbUxZ?=
 =?utf-8?B?RUVGdHo2dnNhbVdaNG8vZzhNb1VFaVRVdHIwd2RqWE0wQ1V0TXdwcVlEbUpG?=
 =?utf-8?B?emk4a2o2cWthYk1GSFBQYkdBU1ZTSm9jbFJaSTRwZFVvRXlqbW9Zd2YyZVdt?=
 =?utf-8?B?MHBseVBnejVLYkpObDdrdVRFdG1Ldit3ZUpJTStyNmc5NTkrdEd6ME5JQVlF?=
 =?utf-8?B?b2xNLzU0K1BEb1NlbUEyem9LYmw5SVRPNS9lelN5cVV1dVAzb0k3VHN5cGdY?=
 =?utf-8?B?bTJmOUJSc21ham0zaTc3cHA5REVucXBydFRCb2ZhbEswTXMvdmZLS2VVT3Bs?=
 =?utf-8?B?VzF2S2hDUEZ5SXZ5d3N0WHdyRkNCZVlIakhkZG5QUHoraTY5QThyOWNIcFRq?=
 =?utf-8?B?V0F4akhsdTZyNDB3MnduZE5PL3J4U2VLbi9wOEs3MDZSMlNzc2hiMHJEZGNF?=
 =?utf-8?B?bXlwSDV5bWFXaFZPZ1dBNFduMWp1blI5RmZNNC9WRU9TUnI2Q2V2L1hRL1ky?=
 =?utf-8?B?L1p3dnc1ZlFZcmVuTEpsYUkwS1dBd01HN3RRbkN5QVgxSWtxdDQ4N0dyN0tL?=
 =?utf-8?B?amZyY2dkNkVsR0JWUDZzTng1UXRteWJ2Sk9FT214d2hyazNnQU8xUFRxWTBv?=
 =?utf-8?B?NlZ4aTJTeG8zd1FkTTREUVErejJsOFBnSmo4c1FQc0dabTkyWkwvVDBOd081?=
 =?utf-8?B?T1Z0cUJhamp0RExYVytsblpOUG1ieCtOQjNkWFFEOWlISm1WZm54cnkvcTJE?=
 =?utf-8?B?RnIvR1lZNEhnQmlXV2xUeW5jV0FWbk9FS2FhMTNYU3ozV2Z3UCsybnhZS2hS?=
 =?utf-8?B?SXNnT2dEb1MvWUFVMzBNYmo3dFR5TDdBOGk3MUVDWEZTY2NieldRaFlJblAw?=
 =?utf-8?B?ZzF6RFdab29OZS91UjlaRjdSbHp5M1d2RXJPenZNdm0yMGNkOWxRRzBJWVEv?=
 =?utf-8?B?TUprRVhnZU9nLzBXVmtYQjUvL1pDdW82T3BUaUNIRWQ4UDROL2xnYThLdThz?=
 =?utf-8?B?VW5wNVdhN09RczlHWVpoYTVyMFdqN0hZcEdDellTTElrbGhWZm1kc2Jsb1pp?=
 =?utf-8?B?Q09kRTdWQWZYVUVadnFUSENCVlp6b1N3QnVoaC9ZcWNBa1VYODYvZ2IvL3Q5?=
 =?utf-8?B?YkVFTzBJSTlxbTFBWWVyMmI3TTZncU1NaWVrSnpoQW0zWE5QazJqOXV4SWZs?=
 =?utf-8?B?YkhyMEFJbWVMMS9tTlhsWCtHWlNuK1FRSWNBUUFsU3VNU1RSUHFLYkYxaUxo?=
 =?utf-8?B?cVVCTDhWcjdSU2k0Y2I3cjVDa3NmMno0bVlhOGRrWU1lQWhtVmVyVm9US2xT?=
 =?utf-8?B?ZEpqUVpsZG1TNzU1clpLTlNzaUdNbFJ0Y1dnWWM2OHZwM2FNRHlaRHhuN0w0?=
 =?utf-8?B?b3NTbEVMUk9NRzgyZ3ZHWHc1MGhyZUZUMEFnRUxDWDVvK3FxVjJoWFlLUlVq?=
 =?utf-8?B?ZHR4cnY3NTZ2R3djOWJHY2JwYzBWU211SVRRMk0rLzFoMmd5QWVJMFVtT1V5?=
 =?utf-8?B?RkRMcXgvNHpjRk9EQlo0a3E5NWFSU3Zmb2lCeXdFQTRkelZIa3RXVEpqZkRO?=
 =?utf-8?B?QTh4cTNvQTk0V0FwOTJiR0lWUWZUYlRXSDd6c3Y2QkZJdmRiUUNWVTUreFgv?=
 =?utf-8?B?eTNSNnI4bUt1M0JXSDhrN1VzRDRqRlRSaXFtcHFnR3ozQTFDc1N5bVNKaE83?=
 =?utf-8?B?TTdjRTlmQmdrVGhlQmtLbUxabW5nZFRZcitPaDUwVzBKR3RhL2JTL2JuQkgr?=
 =?utf-8?B?ZEtIaUhSU1dHTU5LR3U0akh2RWRCVTZ2bGJ4SjdDbGtGV01GZ3JFeTY3OHA3?=
 =?utf-8?B?ZEc1b0VlMnFZUlZYYVI1OGJROTk3RUFvcE13WHlwV1UzQzc0dEV1d3p2RDJ6?=
 =?utf-8?B?Vno5cjA3VXV3dDdZbnhEUkN6SWFsa3pGYlo3QlRwL3hKMmQyQkhRZDJoQ2dw?=
 =?utf-8?B?czNqZzNMekdDUmE1SDhLVTllM0lkWHp4blcwVDFEcit6OThWUENHNnk1bms1?=
 =?utf-8?B?QzhsTXdvVmc5eUxFWTdFRzRKSXVEMHNrdWhodS96NVpJNUVxdnp5T2dNcjVx?=
 =?utf-8?B?NVN0TlRNRnJIRDg4Wm1lTVpjblJ3NlQvWHFYbmFOUHUrRHJFL0FPR01NL2po?=
 =?utf-8?B?dEU2ZFJFMHF5djYrbUNGd2JhOGhkVGU4bDU0ZFpudFAxY3pPR2FrUDgxU04r?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 817482d2-fa20-443b-ebad-08dd51c98b63
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:13:42.7199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOwIwWxqB8WfrWGQZiprcvF3O7DwdfJj9xJj5w5VICOtHajMRyDTr4+xfOectup3jX0u3v/MRQbVm0jJ/uYLL+9wyyCa0EiUgWnqbXkiK2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Feb 2025 16:13:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6421

Hi Antonin,

On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Convert the png file to an SVG file, and add the UNPACKDIR reference.
> 

The arrows for the build directory are misaligned, especially for the 
machine-specific package.

I'm also a bit skeptical about the position of the star before 
EXTRA_OECONF, it feels like it's somehow part of the variable name. 
Maybe add a space or make the star appear a bit higher (like in the 
current PNG?).

A remark for the original content as well, but I don't really understand 
why B isn't passed to do_configure and do_install as well? Isn't it 
where build artifacts will be configured before do_compile runs and from 
where do_install will run in order to install files into $D?

do_configure[dirs] = "${B}"
do_install[dirs] = "${B}"

in base.bbclass for example.

I'm wondering also if we shouldn't have a bidirectional arrow for B for 
the configure and compile task as they are run from there, i.e. they 
generate files in there as well?

Cheers,
Quentin

