Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB12C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 09:56:45 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.45])
 by mx.groups.io with SMTP id smtpd.web10.4579.1745402204224052915
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Apr 2025 02:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FLDWycdb;
 spf=pass (domain: cherry.de, ip: 40.107.247.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOg7JhtSxRu/m5ouUdziPRu6pCUySriRBJE1EACrVatv7LrYJNEdfPj7nY3Tcr0myrvURUCKULiZaqG0qg/OfwVmFM+dgQxfb0cR3BP2S+oMWfbCpd31SRV8HVwmL2/dFxS7xkbAYtkdU9x+KfX/1Wk52puH7mtn/nQ6YyBBJh67SLiJ7pEf0VVSdoyRh9g6P584fa7ms3mJkyYn/PnwRJXfwZssV1SxYuqr/PAeCgey7VyrczUvpD3X/Rf75airqiAHGrMiq4xrW/X+nCCjNTybGN8vTSSekJ7HaQHDFFm5gSOoIzEM4PQzPoCvIIesvnTZrtmKjCTarr0hII2thA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vowyzNm+6hLnm9eaxb+jSQs5L1+b9B4Eh37dRoBUGjY=;
 b=u2VlRllRA6qjjW86VVL3XbFI13xVk+ROcwXrI0Xw3ENyS/DI3rq3OeXC3zGFk8CPXkwvvHpMV7AKuUFXx4Evstu39KzBScb5IPIC7mj1eFO+v0HfZSlx6+RWdPZ2sDN3wLqd4rp3FUUMZGQl6vFrLKb9/H9kKvD1UNzJl21Jl7HuEe7owvFalRYwJkO/AYPgqHf8eOd5GcRedi00r91QeO2Ig6gJPjTLCwtr5OWodHbaLh4IonD76b9uUAKId5ixyCldoRFQQ8hYJfuOIm6q3N4/x1wzECOjIg/5EYbJOI/svvqDLgGv9eIJFSc2KsrcZPLZlasJLRjR+HH4KZSJ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vowyzNm+6hLnm9eaxb+jSQs5L1+b9B4Eh37dRoBUGjY=;
 b=FLDWycdbwK37WepTybzCIUjZCExF9EYBUStSVbFaaOrxYrRbHsMvSSglFy7m30Pyz8lnqTnbB/W2X2QOSztDygKdoBvLTD4gFQXt1BRlNalTmdM/7bkshulkkID1tTm2uFJe8lsA8tLMVIeZlTVA5P2lvbxQWp9q67TlNgYxqRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB7164.eurprd04.prod.outlook.com (2603:10a6:10:129::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 09:56:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 09:56:40 +0000
Message-ID: <caeb301c-abfe-4220-b24b-1073f43efc3a@cherry.de>
Date: Wed, 23 Apr 2025 11:56:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] poky.yaml: introduce DISTRO_LATEST_TAG
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250409-fix-distro-dead-links-v1-0-616b62185d04@bootlin.com>
 <20250409-fix-distro-dead-links-v1-1-616b62185d04@bootlin.com>
 <e2d275ee-5657-4dc5-a831-1edb565f85f3@cherry.de>
 <D97WADVD9D0D.3PPCH5GX3DOL0@bootlin.com>
 <0f03eef3-4de5-4276-b692-0fd18571ddbe@cherry.de>
 <D98QDOH9EM5M.2LNH55O8DZ8IC@bootlin.com>
 <62fb508b-741f-458b-ab7a-2ceed64a95be@cherry.de>
 <D9DWY617J6W5.1G9WMLH95TIIF@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D9DWY617J6W5.1G9WMLH95TIIF@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: d31326ea-f70e-4222-dcdf-08dd824d250b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qi9wM0hBN3M2bHBueGhUcHQvSEJIeVBEZ1J6WENwL3QxSXdBR0QxVnd0RkVk?=
 =?utf-8?B?QnpHQVErZmlzR0t1NkZVSCtGbElmSjJLVzZwZUQxR2dLb201YjhhZDIvU2Ir?=
 =?utf-8?B?bWZlN3lNQTRLYWdBK2liRkEwUE1YR20ySEhpdEorcWxzTlpHdTlWMzhoUXlu?=
 =?utf-8?B?TDlZTUQ4VmJVeXN2dTNKMDR4MVorOUZ4VnVRSThXZDBzT3hSTm9pbTVCcCtq?=
 =?utf-8?B?TVhoTEtuNUt4ZTkydHlyTzhPYmdvZWc1QUREYzNIVFgwdklHUXU0aXAzOCtZ?=
 =?utf-8?B?TmxpdmdkcEVYc2lwVExkSU5hbmU5VFBZVzJTVCtFSXVGMkpmNVVqekp1bUlr?=
 =?utf-8?B?Rm4vM0IwNVhTKzh4RU9jcXhFa2tTN1NkeGp6ODhFSzVOTjlEb1hRQ1h2bDI2?=
 =?utf-8?B?UkJnVXEzNmpaY3RkWGhBdlc0eDdWT0tydE45WCtlMmRDT256TVQ3bVpUaXl6?=
 =?utf-8?B?Z1lnd3dEb3YvakowWEs4VUFyMEVZbU4wSmIyUm1aVnVTQmVMRVlXcEFsQ1hm?=
 =?utf-8?B?cDVtc3QwcFF2ZHFkaXQ2eGt5cTdmQjFtNFg3cVNDdTl0U0JDZ3VNTmx0Z2VJ?=
 =?utf-8?B?WjlrZVBRSHN3ZzNMbHExNjhDZ2hjV0JqcmdaZFljaUFtbElScFhuL0xvcHUv?=
 =?utf-8?B?L3V4cGJLVVJ6V3ZVa1lwSlhoSit1YTFTU29TcVB1elB5TzZUVFZlRHp5K096?=
 =?utf-8?B?VUlKcXo4bzFabGlBdGFjOWhyLzBJdFVBOEtRQlA4UGRaODc2OUJKalk0cEZS?=
 =?utf-8?B?akNUVWNWQXdvcWpzOEdzdlczMDF5YlBRd1MxOFR0R2IzQXVpNk4xZTQyWlJq?=
 =?utf-8?B?TnZtZnlzTU5CS0t3dEdQT0dpamFXVjg5Y3gwcW0yUU5TMUlncjFROUp6SHRZ?=
 =?utf-8?B?NTliMGZhN0wrZXZrakZKdjl6cmZ4SVdKdVVuM0FXWXNWdUVhbVRVb3RrUEgr?=
 =?utf-8?B?K0lQakMyalVPQUh2MXZCTXN6aDdpK3FFUk9nd3pzODc2aWwyQlhyTGxVRmp4?=
 =?utf-8?B?bUd4aE9oa0x0N3hyUWNlUzZHU2M5R1F0MDkxUXFyN2l1VE5IeHNxM0R2UWF1?=
 =?utf-8?B?bnNic3hQbjZzK2lObGtXQlo1a29NbWgzWityMXZRWXNhT3FueC9QaHJHRWJO?=
 =?utf-8?B?bCt0ekVobVM3b1gvdXhvd0Z4Nk03TGFWUFZYZExIaGJySm1idHZaM21CVE5Q?=
 =?utf-8?B?VUJtWEFOVnNuOXlNT0s4ZVRLNm9xdHJ4Ny96MFJmSit4R1ZUWEZiaUsxeEN5?=
 =?utf-8?B?T0FYRFNZbDJjbnRHR0lqT215RlNNRUN2dXMvQVU0RDU3Qjh6WFhGWEh1WUJ4?=
 =?utf-8?B?WitxVmpkZkQzbDQybWJENDV2SVlSMHJTSVp6Uk1SSTFhN0ltMnZCTXd0UktZ?=
 =?utf-8?B?MjY0ek1kTjdWcWFldXlObmo2VVpSSnFyZXYyZW9XTmlqZDJmemx5ODNNT2lj?=
 =?utf-8?B?Tm50eTM1dXZQKzdJc2Fpa2xqRXNNMk1naTQ0eFBZRTQ1cmNFeVc5MXg5ZkVi?=
 =?utf-8?B?ek1PRmUxYnNLTTYrSHhzdklvOEFEL3NzYnI5emg4eEx4NG42UEpEU01Rd1dW?=
 =?utf-8?B?b1NTWjh3OE02UVcrWklsc3dia0tmQTRDTFRuL0tIci96dE5XbzdhR2ZweVlk?=
 =?utf-8?B?U3hReE5Xd2w2ZlB2YXVYRlhVdmpaZmw0VmtwNFpXUFdIZGFXajZUemliYUVH?=
 =?utf-8?B?eHV0bmE1eCtFcDNocTdleWx6K0xEdFZUeDJCNVZsZ3N5aGhnUHFCbW9WaUJj?=
 =?utf-8?B?bkNUa2dPZDU2YWl2ZzFoUWkwdExRL1BKRjkyY1JLWTdOQ0k3WUhQOU1EaDA5?=
 =?utf-8?B?V250TktYM0dKRUJHMGFvQ1F2QjZxVmg2ZThMSTN5ZTVVTnhUTWZDOU5QRnhZ?=
 =?utf-8?B?T25CbXEwOCtra1dzQzhheENtaXdva2tnU0N3YjRzMXdGTkxMR1NXSFRhbDNO?=
 =?utf-8?Q?FndUv09YZbo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MnJaMmlaZlJ5YUdzMmRid0lEdnFXSk44M04vMkdFQTVyeXp0WTZ0Rk1WME0w?=
 =?utf-8?B?c0wyOW1pazh0UVJzd1JRMDRvYUovSmEzSEhXbjI3YUVzNzM0MXcrSThFSE1R?=
 =?utf-8?B?TnJkblNyREd5MlByckdtOEh0Q1JNWThzaTdPUHEyeDVXVWxjdzBjSUJ6Q0tP?=
 =?utf-8?B?NTF1WU83dkQ3RXp4cExGUUxZQ25LeGRrY1pJSkZYclBOR0dtQURKMVpjbk1n?=
 =?utf-8?B?N3gvU3pYZ0haVVdpSXpoNGFSZW9RbEluZWVseTJFV1V3WEdaZzVBclJYNlZN?=
 =?utf-8?B?UGJtbzNoTjBaVkZHaTIyYUgvV3J2MWpNNmFiYm5IUTJrRDlGNEJMZlVjeS9p?=
 =?utf-8?B?S1plVUNDRmdyOTdMMVdxQ3U2bklETFdIbFJtbWcvTGtDb1N4MjdsVWlHMldk?=
 =?utf-8?B?Q2xiOXJOajBVQXZlM3Q2bVhOdHRNVUFac25DV1doSE9MZzNHM1p6TjkzM0Z0?=
 =?utf-8?B?UVJkQ2g0V2lxY1FXYitnNEJDNVkrTXRHem15dDdGUXpYcW5nVDBqemtRMDZW?=
 =?utf-8?B?OGlyWWhKcVFSK2dFYkJpeS94a1VWcldmK1hmVXl6UmE1TTdPRnFGSzdtbzdD?=
 =?utf-8?B?UHRVVmhmRFRiTGNrTVdYYU9lTTk3bGdkcldqcGNjUkdCck92UE9HaW4zWjJU?=
 =?utf-8?B?QitWN29kNSsvNWd3eHRkcXB0SXgxRDk0dEFub3NoNmRneGNPL25QTG1BZmtD?=
 =?utf-8?B?T0Q3dEdNVkpLREgwSlZPZmlmcEwxR0hURmduVUZZdnhiYWRHOWp6WFN2U3Ev?=
 =?utf-8?B?Z1oxSUh6OG1WdTExWjhybGJ0NWNGOFV0RkpVWER5eFBONk1VdzFncGVFZHZU?=
 =?utf-8?B?czJGUW9nN3I3ejhWeFgwWkdiNlJ2OHo3MC93YzlDRDg1RFlwSlVxVUlzZ0ZG?=
 =?utf-8?B?T1NuY2llRHltZFpacjZDWStWd1Jqckp1MVRsa2pEemE1OGF4UTBGemVUSW9u?=
 =?utf-8?B?N05UTkI3TVE1ZTRBQm5Ca0Q1ZVQ2MW1weXhLRUJzdlAxNnhGME9nMml1bVVF?=
 =?utf-8?B?Wlc1VldYT3JhbmJuT3lOdUc0RkFjR0JWSjYxVkVJVENGVEt5VnV3eGYzcCtq?=
 =?utf-8?B?ZEQ1ZkpZUXdwMUpyTnkzZ1lFMkpxQVlnREN1Vk5kbERoOXAzZFMzWEtBaFpT?=
 =?utf-8?B?VlFnL29uandyL2hRN004V2FqdDBreDF3WDFOVjVwdElXb1hzaHU0UkUxaDdp?=
 =?utf-8?B?ajdTWFVIcUdibnFocUZ1OWMyc2x5aWt2Zkp5ZmNJT1hBdTJpMTd4N0RyTVJv?=
 =?utf-8?B?MTM0TEh1aW1KYkZCbnFRWVpDZ0JLTmZnZThkWFNjYklNWnBjQXNMTVZPRDhn?=
 =?utf-8?B?UDJpQlQ2OUFVRlhYTFpVbVVQRmJnRkppc1F3eUsxQzNyc2QweXpMWTlnTkNq?=
 =?utf-8?B?d2JaZ1JtRGhkY2h6d3RFcitBL1B0SmFST0lOM2JCSWYrN1FGUjJUdTErKzht?=
 =?utf-8?B?VnVUY3l4ejRGZVRMbUFNMnlwY3hWWWk3N2RybGpaSGVSdUlMOTc3eWhzUVQz?=
 =?utf-8?B?L1dsdHhxSnNPOFBNek5PNVU3emRpaGhQTERHSU9QYytjeVZ4b253YVNMWHY1?=
 =?utf-8?B?R0t5Qlh2M0VjMjM2am94TUpFZmthUTlKUytwdGFzQUFmc3lmNUJLaW9zL0l1?=
 =?utf-8?B?T0grNWdGYTdCQ2pxb0dOY1J3R05FbmdyVXVsVzE5RUZaS0lBYitnK1Vkdy8y?=
 =?utf-8?B?ZTV3ci9wQWlyOVVyVm1GMHA4My82M3B0WnNFYUovNlZLQ1FDajZveHpnQmlj?=
 =?utf-8?B?NWJIazh4TGVEbkZTTDdDRUdBZW1wV0lpbEd4RC94ZVFSaVhac1gxcHlnN0NX?=
 =?utf-8?B?WnRjTkV4dFBlMStYVENjUm5QaHJvTU03VHhQem5zZ2MyNklLdDYxdFVQM0kz?=
 =?utf-8?B?a3JSVmJvTENncjFzNWdmNVBZNjAwTXAxK3hoNUZkVG5VQW9EZEUvY0M4QXIr?=
 =?utf-8?B?ZkpYNnpBZzNaZWh3cnZpeitGNVRYZXRHaUo4TEZkNk10d3I5M0hhcU5tY2Vz?=
 =?utf-8?B?bWladlZJejNwU0U5V3I1SFdZSENpQnRZbHUxeklvRC9uaFFQTGpoRGVOSE5x?=
 =?utf-8?B?Y0F3OVRjb1NmL0NQT3JRSEtOZG9oZ011SHZMR3R2a3hNVDdHUlBScHNGQmRt?=
 =?utf-8?B?N2hCOE9jRHdiSVRkTnhQeHVOUm50RldzR0wzWjVnK1NSY2FGZDFFS01qSzUv?=
 =?utf-8?B?aU1hVGIrMGdsMTFVV3BzeUF4MGpSQzRyMVVYUzBWZXgyeU9YZzlyZ2xqV1cy?=
 =?utf-8?B?YjdvUWs0MFFYNlJDY3FnV09vYld3PT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d31326ea-f70e-4222-dcdf-08dd824d250b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:56:40.3432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPmV6TgqKuujH1jfeBpg+mPAQEgBe6BhS7yjaMIdUzMBNf/SdCGODgGDqiQyDivpRs5UyVer546rVEYjHZYUil3A5dcY25ituaXfh6d2bZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7164
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Apr 2025 09:56:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6777

Hi Antonin,

On 4/23/25 11:33 AM, Antonin Godard wrote:
[...]
>> I don't think we should be using &DISTRO; anymore? Most of the time we
>> don't want to be printing .999 on the landing page of
>> docs.yoctoproject.org! For the dev page, that's different.
> 
> I would like to agree, but at the same time, wouldn't it be confusing to have a
> real tag (e.g. 5.1.8) when reading for the latest tip of the branch? It would be

Does it matter? We should only be doing bug fixing and ideally without 
breaking backward compatibility in a given release branch.
Again, the development (master) branch is a different story here.

> somewhat accurate, but not _stricty_ accurate as to which version of the doc you
> are actually reading (the latest tip).
> 

The issue is that this tag simply doesn't exist so we should absolutely 
never use it when code is involved, as the instructions will simply not 
work.

> I'm trying to think of a way to make it clear that 999 represent the branch's
> tip.
> 

I'm failing to see how it is relevant to the user that the docs are 
built from the branch's tip instead of the tag?

BTW, it seems like once you're on a tagged release, you cannot go back 
to the .999 from the dropdown menu, is that intended?

Cheers,
Quentin

