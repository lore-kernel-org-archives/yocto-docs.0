Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F2CC3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 07:50:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web10.7664.1747295437648611697
 for <docs@lists.yoctoproject.org>;
 Thu, 15 May 2025 00:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HlIYRlDS;
 spf=pass (domain: cherry.de, ip: 40.107.22.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c87Rtrwqv4WY9N3jJ7+Q+D5IsGg+gL+uun9aEwCJ4HbE9TwrtqgtBdQORYaGNvRypmwmiLsoQa+FmyUfHbiAbsZlGxNAt7DGGNACNmyo9v8VdEJGLdAxFbkhxOnF6tAmhI4dLt4cI2HyERStiUg23RcMr6SiA0sb0x0HIS5E55k4cjoFy1rdhjRfmxRzU3cZHlhiAyRhg+QfAGdobfN27tZ1+GCNDXgyiTGjvSqEvH1iSUh2/rETkc/r/EA9ZZqRse3lcnkB6tIZrDwh8kZkSIrSwByTAnK0vSnrJCppsg6W0TxUQKUuq3t1JqsCIy7nN7f7SWgoO4cL2i3pcHdhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ+J8l6QPK3DMTFa8wU8fj33aTm5Tr95jxadz+CPgwg=;
 b=BYGsB6423bvl4sG3eikenJ5G5gjTl57IoxOo3pnskONqRvh0bLQlVzO8Zyg7aX7PSeWRSIBhNJl9UKV6vEygUx+FcMrBBUuJAfTYhye23aPd1Us0OYHN5pZwPDJ0OFuZVdFFF0GmuGwrJvJBOPtHi7ueUjVn7pilkNskNDjOPAjzggjj+Ar8/EjQ9VG+wKyoNlN0hOt1YSKdfQo3+aTQkDzuBMYSpjo6at+uNtXGvmzHf7aJXZ6hHqNNW4ofWc7WWnU/EWWQsVAkF82uAiOzleY+S7/BLtuDfptxwPipUKLUywDgr9NKGCKgP0MVM+yPDPzM3f830ZgB1IymC3dutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ+J8l6QPK3DMTFa8wU8fj33aTm5Tr95jxadz+CPgwg=;
 b=HlIYRlDSR+oZ6i3fSEb4i9Cg27xrfeKCEsJStbkMHGPSlmBwteJ4jGUTJjTfeInPzywBoJWQOKLjl2YDVXp0aoDqgjhe9mvqEpaPKQzbKppPqf67ZXAFUklwSJ9Nxf9285sA80VdbUvvl8H3UlVG3RvDpjD35YSRw1pgtE1At/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DB9PR04MB8155.eurprd04.prod.outlook.com (2603:10a6:10:24d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 07:50:33 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 07:50:33 +0000
Message-ID: <33eef3df-3f24-4b8e-be45-3552d43252af@cherry.de>
Date: Thu, 15 May 2025 09:50:33 +0200
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
 <caeb301c-abfe-4220-b24b-1073f43efc3a@cherry.de>
 <D9UW30Q030G2.22VWR1SASAWG8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D9UW30Q030G2.22VWR1SASAWG8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::8) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DB9PR04MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: f879b378-192f-4496-85b4-08dd93852c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVN0ZHRIUFJEQVMxN1lJdVpEZnA5UjdpMnNsMGZUL2pBOU9IMlhLK2RibEhH?=
 =?utf-8?B?VW5OOXlibEprczNwbzhiQWxyOUhLOUpRWEhvT1pWSEJPRGNnNGE0YXNkaS9H?=
 =?utf-8?B?SCtnaWEvYlFVT294WlRxZzROcjhxSDdIRjBOK1lpcFNXYytuNEorYkE2TytJ?=
 =?utf-8?B?MFdUclQvM0VoV1lIYkQ3bUJxaEIyeDgzQ3p3aExaVjJGMEdubllnNHZVc0lW?=
 =?utf-8?B?L25nMUZYa3ZFWUlwdFhab1pOQzJVUTFBSDdZZVp1aUlUMHR4Z2h6N3lENFlT?=
 =?utf-8?B?ZThiczhibHhTM1dLWEsrZUNUa2VZQWxSWTM3T2tVRkc2anF1QWZoMlBSSklE?=
 =?utf-8?B?NGFJRVlHR1NlK21YNlFXTmJGd2JhSVA2VURONm9ZckNsZWdGSDFOdDZaajZO?=
 =?utf-8?B?Zy85dTJJYUpZTmR0blRrSkZXYVdLdHZOODNaZ1B4RFM1Z2dJYm1hVmhYaTJC?=
 =?utf-8?B?aHhIWVV1UzJMU3hHMGRQZ2RJZmhUeFpibjdRdERSdWtmNXZIU2JxMGVBUVdr?=
 =?utf-8?B?SStwSWMybGl4eEFna2xqdnBIQXdiZHV5S2loM2JxWnk0anBlNktvYWRoQ3VL?=
 =?utf-8?B?MmJxdkRWN2MwR1Q1WHU3S3dJTnc1SE1LeXBFazBCRGlpZytDNnphZ2VRUWo1?=
 =?utf-8?B?V2Evd1VrVXpGRnlnclJLZGxqTFBXZ1RYcGprbzdTLzlZMEd1b3FLSkNrd3VF?=
 =?utf-8?B?S1RWaHZBSTNnc2Q3S0FxdUw0WHRoTDBxVU5nZ2dPSFN1U3VHSWVMd2RhREQv?=
 =?utf-8?B?ZVdZaG9GL0Z5QVRwZzNmMmEvSzhYeVJkOTV4U0I0N2gxN1M4dGluMjZjc1Rq?=
 =?utf-8?B?SkdkcjVIQmFSeDdiaithWE9sL1p6UDEwY25WRkgxbGNXdDcvdTVrVmRxQ0Ry?=
 =?utf-8?B?ZG5YYXMyUlpSc3JYa2dNK0xRZlFSRitjdWtpWU1nMDIrRkRXbUNjNk43NDdj?=
 =?utf-8?B?MmpFVzBaT25aQzl0aEduZWlxaXVwRERGVWx1WUdCMDVvSCtnRjJRampoSGQ5?=
 =?utf-8?B?MlhDQ3FSV3BVQ093OHZackRySDc3VjJTUVhKMzhrd0MvNWFPRjNuM1E1SzJT?=
 =?utf-8?B?Z2N0UEh1eS9ld1hFQWdrUTRFYmkyOXhmamFSZUxrazdaaW43MUZUZCtqbDQ4?=
 =?utf-8?B?NmJGdEZLbGdubVVBQmZyZ3ZoMHZLVGo0STNjaG1reUd6U3R4Sm9LaUkyZm9F?=
 =?utf-8?B?aHJsNTkzVnBSUERSR0I2ZjF6TW43VnNNU2k3dmFONFAydXZpUjVLSXh3TkR3?=
 =?utf-8?B?Y3RoNng1WHZMYUVrLzArQjV1bjJXb2N1eVdZMTU1TzBxSi81YTdxRmNFV1Vt?=
 =?utf-8?B?bEFVdU10R0xkTFUydFNTZ0Jqemw1eXFVTEdvcE96M1RjcEZWRXA5SXhycGxU?=
 =?utf-8?B?OUNLWWpSMU9JRUhhVWxIRy9zc2RGQU0yVEtkeEJVQzJFUSt4cCtnL0ZVTjMr?=
 =?utf-8?B?ZEpPMGFEdHQ2MG1WWllHeVJlYlI3MHZRQ0xFSDY3bEJxdTdYQWZoeUtoWWNm?=
 =?utf-8?B?NEhiVVdQU05pd3FadVRKb0R1NEpGS0phbDE2S3hOU2gwMG1hOXNrNy9tQmk2?=
 =?utf-8?B?WEtkWWowekwxV0dxSDRRa0FuRjVoK3RzSlBJanI0KzFma0hjVFdLemxIUnpX?=
 =?utf-8?B?ZzBWemM4NElKM1BjS3lvMUhKRG5SRlE5SlkvZC9zK00zVHJIRDVKMkZaallU?=
 =?utf-8?B?VVgxK0JYNUJNcG81QkhFR3BDWDBESjhSU0VXSEsxR0F4Z3VzUWJ1THNWY0Nz?=
 =?utf-8?B?dTdua3NaZ0doWGFuanVlNDN0eXdTa0dhZXlVbDFnUklBZkhDOVlXTEx1ZDhS?=
 =?utf-8?B?anpqeVdVemN4VzdrN0haRjZIWkxDVWhmUVhxU2NhUW5wcFJQdWF6YnNWSkk4?=
 =?utf-8?B?V2NUNFFzVTQyMXpFc3BLeUtNekFLMDZmaWtjcGxYblhCQ09sTDRDMEg1V25X?=
 =?utf-8?Q?5teJAxctrDc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVZrRlBDVDc5RjZtQzVPYzJ0Zmd5NmRNRHhCd3pHRFl4U3VrTmRFaEt1VFlC?=
 =?utf-8?B?RWszVG51UXVXM2xObVpqcVpMQktmeWQxNWlSVzJxWVBaaG1mT1VEaUJhd3Uy?=
 =?utf-8?B?UHk2dmpxZ0t5clkvK1F1cE9DcnBrc0lkdUVMTnRPbWJDTVR4NVZySTlPUGFK?=
 =?utf-8?B?THlxalRuTjZTQXJXWjhlRzJqelplVisvL2Q1dFFXSVBSdGpudkZtaVBKamJ6?=
 =?utf-8?B?cUdQb1RkRHRjVjBOWTFIb0V4U01qV1pkZkZYVGp6eWtWZ0M4S3dPQy82Qzhz?=
 =?utf-8?B?bDZYYS8vdnRTRGYraG9CeWF5OWRvM21sa1UxWWhFV1lCa1V0TVcyczVMaHdl?=
 =?utf-8?B?Z1FHRWFoQytyOEhSS0c1NUZQK1JYbkZWWEY2a1pmY3Z4UFh0S3VQandKajZK?=
 =?utf-8?B?ZkNnRWRYd0RMNEZGNDdMeUc0SXNtMUhzUzZKOXZaeUZack52d0MxbEw2V2h3?=
 =?utf-8?B?b09KSlNkdTBEU1FzWXBpNDBsWHArQ2NSTlF4WmNXOHBxbjNvTlJHc2ZRempt?=
 =?utf-8?B?YjJkRFRocmNBS3dEWjJmM2tpOFhxRkU4UnI1dmcwOGxTdlpUZzdnLzJhVnZQ?=
 =?utf-8?B?Nll6dEdiTUkrTGFDTHZLKzhMcEJYODhzcjV5djBIQU9GZkRiT1pGTnh1dWxz?=
 =?utf-8?B?Sk43OTY2N3NHOWJnaWxKYmtyRVVaQnRqdEh6emFLRzN2RDhyNDYvYldMelFO?=
 =?utf-8?B?WlZXSWI2SnZXQW82UTlaSURLdG8zYkNVU2JoY1lIN3o1ZXhSdGJYK0lmNXAr?=
 =?utf-8?B?aUg2aHdISU1MNENtWHBYZ01EK1RpcldmNWdQNm9XRkVMV1dxZU41V3lJVEdM?=
 =?utf-8?B?K1dVS0xCOGx1NFoxVlhEdllZVGVscC81YjZNUlJtMEUxWmRvY09KL3NWdVpZ?=
 =?utf-8?B?WUtiYnBLSDdmZnIzSnQ5Rk4rbE54M0VFbDQ5REJneis0bWVBWC9EUnJ1ZjV0?=
 =?utf-8?B?YjhTc1JDVGVJK3Z2cDlkTHBtdTFlUXo4aW5vRHRXQ1VBYnFkbEZrMjIra01k?=
 =?utf-8?B?Y0Z5VWd6a0ZLM2RNZTVhenlyWjRTMldoNDJkNGdpdmVsNE5FUmlEMndzbUJx?=
 =?utf-8?B?dXpLSjRsV2hjczIxS2Q5anIxODdHUk5wVE53VGRLRm5jZGdxWmt5SFZWK3Yz?=
 =?utf-8?B?d3F5aUt2b1lEQVNIVnBBbFdsMW9nVTdvV2Fib3RCclNXSExnQXZhOHhEbE1k?=
 =?utf-8?B?SHc0UEhudndmU1BTM2FyR1BtdXNhbHhBV21qSVg2S1MzMVE3Ni9aeDBkZjlM?=
 =?utf-8?B?OE9rakswcGxTZ1FpeTQ0blNya0k3N3VFanBINlJjM1A0Y3NqeUl2MG1PdWZr?=
 =?utf-8?B?aUt6L3VPMG52TXpwVXNVTGl1WGZJdm0rMVM0TWFwVjl0YWpJK0xrYUszZ0pT?=
 =?utf-8?B?T3hDL0JQcm5TbURRRnU0RnZURVV4RzNFbit2Z3htdnQxZldCbzZOQmZaVzJP?=
 =?utf-8?B?aG9EVnZLUlVncnpSK3V2MTJSV3J2WlgxM2libUVhL0tIamVPT1EvbEErNXdm?=
 =?utf-8?B?eG90RnVDTko3RUxlbHU4cWp2LzlvczNDdzZLTVc3MFViZmRBcWs0dm84dUF4?=
 =?utf-8?B?WmxOcVY1OHprRiswQkZGb2l1djVCNyt0bmNtTUNNN3E1bFRwbTMvd251MFIw?=
 =?utf-8?B?MVhsRytFM0hBVUEzWUN5Yzd3OUVITk5vMnI1UXo2RFJ5WDU2dm9wREs2aVdS?=
 =?utf-8?B?SXVqQUhuZVpkbUE5a1dMN3NXdEVmNC9LZW1QZDhGc0kvWmk0TXVjejR6UEd3?=
 =?utf-8?B?N0xQTVI3VHJHNisySC9DSy9yY3JNSUV0WDVrZTdXZjhVUFQ1Q0xCcmd3OTJq?=
 =?utf-8?B?S2xwUnRKVm15RkF4N2xxdEY0RUgrM3h0SnpPaDlIWVZ0U2MwZ0tkRjMzMWI3?=
 =?utf-8?B?cnN2YmxWRHJVUUR2VGZqUjFKZ0pSS204VG5rQjhWVnVZbFJ0eDUzOGV3Ulo2?=
 =?utf-8?B?NHhNRDZ1REUwV1JwamdJd24vYW5CaUEwMVRpeG10RU9uQXRDVC9WMGF6NW9F?=
 =?utf-8?B?LzJtY0hKbDlkLzEzc0dBUk5NaFpBN05JbHFBMEQrcjYreXhaeDA2aVdXcldZ?=
 =?utf-8?B?TFFlU3BoSGJ2RVAzYjI1cWRJcHpZT05kcWViNWFlMFphNks0bFVkYWs4MURh?=
 =?utf-8?B?U3RYWHJJam9JTkxkMkkzNS9zSEMvYS9JU3FLeWE1NWVOOGdzVEtlcWIvRTZq?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f879b378-192f-4496-85b4-08dd93852c12
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 07:50:33.7299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGqiV7lbcrdKb9rOV6+I9A85im6DXa0OnutRdfpN0tSIQKjQK97V+80XlH8mmoSqazbKCa8XLss8t1M8oESxbi7stPjRGF+ynFZqA3Wdc0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8155
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 May 2025 07:50:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6824

Hi Antonin,

On 5/13/25 10:28 AM, Antonin Godard wrote:
> On Wed Apr 23, 2025 at 11:56 AM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 4/23/25 11:33 AM, Antonin Godard wrote:
>> [...]
>>>> I don't think we should be using &DISTRO; anymore? Most of the time we
>>>> don't want to be printing .999 on the landing page of
>>>> docs.yoctoproject.org! For the dev page, that's different.
>>>
>>> I would like to agree, but at the same time, wouldn't it be confusing to have a
>>> real tag (e.g. 5.1.8) when reading for the latest tip of the branch? It would be
>>
>> Does it matter? We should only be doing bug fixing and ideally without
>> breaking backward compatibility in a given release branch.
>> Again, the development (master) branch is a different story here.
>>
>>> somewhat accurate, but not _stricty_ accurate as to which version of the doc you
>>> are actually reading (the latest tip).
>>>
>>
>> The issue is that this tag simply doesn't exist so we should absolutely
>> never use it when code is involved, as the instructions will simply not
>> work.
> 
> Right, so the code parts of the docs should be adapted to use DISTRO_LATEST_TAG,
> but I still think using DISTRO in the textual parts is useful to distinguish a
> branch tip version of the docs and a tagged version of the docs.
> 

I don't see the benefit. But we can start by fixing the code blocks to 
not use DISTRO and postpone the rest of the discussion for another time 
:) Progress is still progress even if it's not perfect now.

>>> I'm trying to think of a way to make it clear that 999 represent the branch's
>>> tip.
>>>
>>
>> I'm failing to see how it is relevant to the user that the docs are
>> built from the branch's tip instead of the tag?
> 
> There might be a reason that goes beyond my work on the docs, but it is kind of
> useful to me to monitor changes as we go, or just to provides up-to-date links
> to people.
> 
> It is questionable that this should be the default landing page though.
> 

Ah, this I disagree with :) And I think this is the reason why we have 
this in the first place.

There is a very simple reason for that. We never have (or at least had, 
I don't know if this has changed) the docs ready for the release before 
the release is tagged (including the docs). This means if we were to 
always show the latest tag we would be missing information, even for the 
tagged release (e.g. recipe version bumps, cves fixed, known issues, etc.)!

Even more so, we want to avoid having to wait ~1+ month for the next 
release if there are important fixes in the documentation (e.g. 
misleading information). This we can only achieve by using the tip of 
the branch and not the release. This also apply to outdated releases 
which will never receive a new tag but we may still want to patch 
documentation (e.g. links have gone bad, misleading info, etc.).

>> BTW, it seems like once you're on a tagged release, you cannot go back
>> to the .999 from the dropdown menu, is that intended?
> 
> Sounds like a bug to me!
> 

I vaguely remember discussing this years ago. I think the issue is how 
to represent this in the menu? Should we really have

scarthgap (5.0.9)
scarthgap (dev)

for each release?

Cheers,
Quentin

