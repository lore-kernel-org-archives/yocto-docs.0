Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024E4CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 15:22:33 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1081.1762528949382015431
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 07:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kVvDbfZl;
 spf=pass (domain: cherry.de, ip: 52.101.72.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0Iso66dofNTUrqtrq5MDZtvfUSP+I9ts3KW4/tmY+H6uXroLkDNNtC15S2cf8AVWQttKC8bJ6q7G7tJ8dpR77peG9WUQDxa+8CgYgTAHi8QPqn1OF/szsA7exr+o2krTPQTa9skC0W81qqFrgrcjCIdDEhIQ/4MCFH7KlVUFa6mKW/DSqPdUz+00ZlBH7xxr/E80GnjFyp1jtZFInt6+gnW98chqMyqrIxshFWVi9+3N/6XbwIP8pMyoOLk4vUUNdA5MkrFDgWd9CbySmeuo7/mqjVxrHNtaaBJAoqpbLZnJ1ruX13zprYQBWYjGvte3JC8t5TA+vZfl1cdntlpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vidLtNj8UXOVsB305XA1B5Oiyzib6q+bBuvJw9kBAbA=;
 b=pouEZF/e2u8oHpqd+DsJDrKPowJ1TI6MkLlYIMwe+ZjW3C/zVAfEDQEUoquLde6lcWvgX6/OYQINpzLjqXiGmYitNO8M6obWwtREI4x35faf8AGTiTOt4AhB8lixlmmwXHtSeaDrSndA/17i7jyjLp8aXMUcwZjEoZ0Xa65tXLZ0Edv2DD5SHhhnGLMfqHnlj2b2A+aR2OloE5+x2TY8wwjEL0EWk0IA38T/O20vzMcoo0iTJ0krP/OIrkuiEzqYrFec3QG6428z6AHiYc1O0Qy18JL5lDSz4YKEfPDprYTcf6Q7D5mzaB0hf4sNj4yK0StMc6TnJ8zF4MCcdxafPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vidLtNj8UXOVsB305XA1B5Oiyzib6q+bBuvJw9kBAbA=;
 b=kVvDbfZl4h8blFESCc2P1Wl9pJTYJpAx2qduB8W7BWH235YOfVLtwdpiJAAAKRrn2v0Tb3LUycgNRuBDhhe0Ex8EuSwzHdVb3z3cwyi8oHWv1dJaduez+OxbF+X/5SyffuCVrt2zEP4eYop+aFEg1B5dymFeqQ+UJmRhBRTQSsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 15:22:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:22:25 +0000
Message-ID: <c725410d-0ac3-45dc-9990-d5ae1f5e9a6a@cherry.de>
Date: Fri, 7 Nov 2025 16:22:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH RFC 3/3] convert SVGs to PDF and PNG using
 rsvgconverter plugin
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20251030-fix-make-multi-target-v1-0-213616ed1f0a@cherry.de>
 <20251030-fix-make-multi-target-v1-3-213616ed1f0a@cherry.de>
 <DE2JZQ0TYUAH.3A1ZWC5RN5WER@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DE2JZQ0TYUAH.3A1ZWC5RN5WER@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e36fd6-8f97-4f02-51f6-08de1e117494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZVJ6QnE1d0FZUVFsbmxobVJvZDhzbnFOVmdYMVhLckpIR1p5YVgwNEFOa01Y?=
 =?utf-8?B?OTFNMXhwNWlmcHRqdXJIR1Rua1c2TzU5NHpMTGorKzk2Vk1QL1J2SnhqTSt1?=
 =?utf-8?B?WTM2NVpiMzVFMWxwMm54Ym5FTjRUWWdRaCtINFNMNmgrK0tMM3pSaGUzMlZL?=
 =?utf-8?B?RUNLRlZ2VUpCU1FkeUllaXEraGVFYXpqZzNKM3NYVW04M041TllmeGNZdGFE?=
 =?utf-8?B?eHdxMWVhYzgxcWlsb2I0RkJZNG5QTk1wNElKNklkUTRPU240YUJjZURtWXFx?=
 =?utf-8?B?clU5M1Y1cFU2cnNYR09FV1dSMEo2NG1jU2I1bDhQeGIzMkFudFRRdVM3cis5?=
 =?utf-8?B?R2lWcFIzK05JZFBNTUhVdUpKa1RKRXZqMTh2MlB4VmRvSlIxeGMxaFdhclJG?=
 =?utf-8?B?YUdzSEovdXhZdVg0VE9BZDB2TEdsS0dnajR5VnJVREw0WUZDVzFUcDFacjBY?=
 =?utf-8?B?TUgzWDZjUDNDMXpFYktwRFl4YjRxaEV0QXBPMG5MdGZpYkp2cmRqY0VQb2dr?=
 =?utf-8?B?VHhBMUF3RmtRMVczRDQyVVVzeFZmTzErVEJVZDQ4TVZYdXVPb0VvYUU0NnhS?=
 =?utf-8?B?RkkzeS9CNExReEttT1piRUt0alpSZi81NmtQWmZPTVRQdmlTZHJhZ3Y3M1lv?=
 =?utf-8?B?UjVoRURkVkRJY0NFL3dRMzRtbWM5YjR2NGdRQ3NrSTdmUWRoaTVwVGwrcmNv?=
 =?utf-8?B?YVNzWFRmQ3hHKzBDU2k5ZnltaWJhTjNVNDgzb29JN3ZJYVNWMzRYcFVDd2oy?=
 =?utf-8?B?aHA2YTlpZVRHc29JT0hONlJsRFdxbW1lckZiaDhVT3NCZUQ2UGtiTmFJaE9X?=
 =?utf-8?B?aTAzKzAxUEJ2UTJTRnp2NnR1enhrNjV1UlFTZWpwTmkvZk56UGNXb2k4enRk?=
 =?utf-8?B?VE1zQkE1akt3NEJLNFJETElyamEraDBPWFZlbFlVQVhCRXBJb1JlUUxIRGZU?=
 =?utf-8?B?SDVOTERjRHM1ZnBmTytHU2gxazlxeUhEVGZUZy9yTGhCM1BiWmJhcTYydDFs?=
 =?utf-8?B?OFlqMENkcVp0NmF0RFRJU2pyU00reUhZTGZYMWU4T2JDOTh4S2lydjBBelZL?=
 =?utf-8?B?MWkrS3pRQmpLRlovU0tmak40RHBwNEtwamM2amorSnNIOGIxdjdIUC9ZWlNF?=
 =?utf-8?B?RDR4elVjYzFJTmdScUREZ2pOcC9uL0ZYOEdXeTY3R2FNZHlXamMrMFhmK0VN?=
 =?utf-8?B?cFRZeStlVzJSbW43M1FoNEFLbWtXZHBZamVHOVMyZ04zdEVJNFk3NlJ2emJ3?=
 =?utf-8?B?Z0xnS1E5MTNVRTF0U2kvQzAwNjlFdi9KeHM4V3ZoaUdBUk5zVDkvTWd1NStQ?=
 =?utf-8?B?akdNZ0pBZXgwNlNpZHlqRlRNeHU3VFJlWlZGRy9PL3VnbWNaZzM4c0dMTlJl?=
 =?utf-8?B?eGxxeGpHTElPZExoVUh2eTcxZVFVQzNBenBmUjNhN3l6SGhUTWpkNlBqRk5Z?=
 =?utf-8?B?MkhPVGhRc3dNa3JZRVE5bVk4NWxTazVkNEFMZmJIUGF6VjRRVEpXTUpOSE96?=
 =?utf-8?B?SXdBNVE1UjFJcW1uYXRjYXdwUDZpZnR4bVZKeXNSekpidjR5KzAyVldUNFNy?=
 =?utf-8?B?YXNMV0FLRWdkTGhqYjdvZlJ2VkVpK1hjbFRLZkthT0tucStETlhqV0s5WVp6?=
 =?utf-8?B?M2JQVEg0aTc1UWRPY2RtN1VyOWtFUUxHODRsejVNY3FVbGM4dlpBZUExMGNt?=
 =?utf-8?B?a3phQkNyVjZacG9sRWw3eExFanUvYUVtYllyN2c5N2NEOXdqTVJZWjkxQ1lr?=
 =?utf-8?B?dUpyNFd5S3lkbExXVXcwUDZDbnNLSlMvQjhuVkFuVloxejRCNkpjOFRiQm90?=
 =?utf-8?B?Y2tScWJTdVppVkJvc1crNmhiSnFtSGsvM1o2YVRWMldmbUNUVXhXVzcvald4?=
 =?utf-8?B?ZGwwL3A1dFRqQWVXTjcyelFsRVVMeEkrVUpaSUlETmt4L3JNWHdwUmpwS1c4?=
 =?utf-8?Q?paUBSBc31Y+AjyRZMG7Mtww3r/p6EtYe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXlhSjRyVTE2QmdVUUFEUHAzVCsxb1p3RG52S21GZUlsWVozSFgzZ2JHS3ZL?=
 =?utf-8?B?QVF0eWRjZWlMY0RZNXNLbFErUE5PSnRWV3NqTHVuUDVXdGRWOThaZmFsYllR?=
 =?utf-8?B?NEdRRHhqTVRpMjZ4dVl3M3ZUc1d6a3hMbXp0ZWNvYmFDL3BTR2xCaEJ5NHU4?=
 =?utf-8?B?N3hnMTlDbVltaFRwU01jL1AwVDZ1OUhCYnoyM29NRUMvaWNSWXA0Mmc0V1Mz?=
 =?utf-8?B?TzJOY3I0WDZOREM0ZXpaSk01b1VzK2U3WCtPb2pCajdQYVo3clNRTEw5bUJt?=
 =?utf-8?B?dmt3RVpPQlJYeWxyNEZBZ25yaDRIRm9iYU03Um5sY2hJWXJZS2RGdkNjZStV?=
 =?utf-8?B?SExxd0xVVjMxTjE3MU1xcHI1dmxKSEVSUlM4L0NacnRMWEY0aC9XU09zc2Nw?=
 =?utf-8?B?WnQzWFl5OE8zb2VFKytYNkZsSnh0TVlVOUFZbllWaTdId0x0QjhMcFpuY2t6?=
 =?utf-8?B?NDFqWUZjN2Rwam53bi80elZrb24ycEhiZkZZeW1KVDh6bjNoSzZVdnB5ZjUw?=
 =?utf-8?B?bnpqUVRqSExhOER5ZXZFZTRubnhXdGtXYzRnT2p3UWtNRTc0UWtoK095enQx?=
 =?utf-8?B?d2s3SnlEYUVRSHIrZUdmYU1ZcFRWNWxobXQ2Yk9lU0dwR25ndnNyb0VSTjly?=
 =?utf-8?B?RTZrSTJkWkt5SVBHcGdqSDFBcm55RG81NEozaTV5Q3g4U0U5cGw3K21qb3ho?=
 =?utf-8?B?VHlXL3dYM3BCcE0vd2Q2LzB1U0xKejVEd3NKeG9Ielg4S2k1THJIZkdibFdI?=
 =?utf-8?B?UE5TZW1RZEdWSmwxK0VtNW9LQ1FVNDB6ZGZNYmVMaDMvNE5lOFBodGdqcThk?=
 =?utf-8?B?YXBXMjlqS0lhNXR1OG9HNHdGSWhQOWpZT2oyQjhWSzA1a21IUEpnNWNIUXN1?=
 =?utf-8?B?V3JkeWRGV1k5ellqYlhnVFlDTVhTQ2M0aEVNZzEwWFVZejdRK1dwb1d6bkpy?=
 =?utf-8?B?eW1TSHZ0S3U3eGpIaEZ1OXl0cmVpZENXV0dURkVubVUxc0c1NEJQRmVXMHJo?=
 =?utf-8?B?dUFXenVsNDdybUNtMUt2aFZacHpjRXViZFU2ak04alZ1K3JWWStRa0tZMW5Z?=
 =?utf-8?B?SHJ5VksxaW9TVVA0bXpzSWluZDBEdUhjZ0dNUGtxOHp4NUhqUDFIOGJPYUdP?=
 =?utf-8?B?Rld5VmVIczBzREJJaFdHbUlHNmF1R2JlME9EZmNPRElSaFE5a1JhK0xLVmxn?=
 =?utf-8?B?L3hsTkdZM2pPcXordm1kaXZZUlNwanRXQnhmV1c2b3dtNjQzSHFwMDkweFJ4?=
 =?utf-8?B?WVVTMHRVa0F3NFJOVk1VL0NCbGFFMTVWaUVGM1Q0djRxSXE0bXhiMXhaSXpK?=
 =?utf-8?B?ZjNGQ3VBYi9pSU52NDMrclBEcGovYUZ3VEIybDJPa3Y0dkE5cHU0UTlrcVhi?=
 =?utf-8?B?RlUwQlg0bjNjR1M4OVdWa2toWExNRFBVMnIwdCswSVFvekFJKzNTcmNOTWtB?=
 =?utf-8?B?WFBSV05JR1VXTW1wU1oxQk9CNEJmek1HWTdwZitNL1Z5bHZMdHpCcjRDZFF2?=
 =?utf-8?B?enJCMCtIeDZRWDI5VTlNUHJIdTVnYU9rbGl3djNJRlgwZjZiQndxUlFybW1p?=
 =?utf-8?B?dFVwOEQ5RzhLRFhmRGcvZFAyMEJJb3ZBWkhGL1RoeHBVMzlTa1BkMXFEaW5l?=
 =?utf-8?B?OUZkbUsrQnp2TmdaajV1aWNMVUJCcFZ0VStmYzNkMHJpR2dSWkxxcXgxZHMy?=
 =?utf-8?B?cm1LUENWWmdBS05XV29yaWpiNjIxc0NuZ2pqNW1sQUxPSGR2dWFEMHFNc2FI?=
 =?utf-8?B?aGV0YXl4YTlHUEZOWW8zS3M5L0NDRmJ4VTdiMmt3YkEzYU5QN0JDbC9GbWVP?=
 =?utf-8?B?Zlk0WHBEdVdacFJXSDlwbUNHVkV1VWM0Q1dPOXFBSHJEQStxL2ZHL29VWGF2?=
 =?utf-8?B?YzZ5eFc0ZFZWOEhIKzgvWVk4ZGdHdU92SGZhOXlSQWQvRnI0dEtMMHhMM2F1?=
 =?utf-8?B?MWRCU29ubURQTlAxcUZnc2xCZHB2U3Ztem14WlFGVkdzWTFzbCtNT1VqazV5?=
 =?utf-8?B?bGtYcTJZZW02U09DTlorWGVyMXFQeFR5MXNLTDRsRkRXZ2dPSHEzdnZWSlRp?=
 =?utf-8?B?TmZXSjU1NnVxNmJPemM0Z1NDQkhQaURKaWo3V1kzMjJmYmNBZ3dmTElKRkVO?=
 =?utf-8?B?azIwU0phZFdJdWExbGdFN2c2MlkwV3FpOFh1WUU4RXNZaU5weVJBMlNMMXBh?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e36fd6-8f97-4f02-51f6-08de1e117494
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:22:25.4246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAB/FAcbckvvZT+iltrdIDQJp0EG0jenlLdvVnWnzbGmOiYkYYBDxhb+HZQHAhPvrVuwwYimwjt2bBDI2yTvFU3EDbPEBAuuZKcUZnknMsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Nov 2025 15:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8017

Hi Antonin,

On 11/7/25 4:04 PM, Antonin Godard wrote:
> Hi,
> 
> On Thu Oct 30, 2025 at 4:17 PM CET, Quentin Schulz wrote:
[...]
>> The epub target is removed as the catch-all target contains the same
>> instructions as the epub target we remove in this commit.
> 
> So with your patch will the epub target include SVGs or PNGs? Apparently there

I haven't checked but no intended change made to what the epub target 
will get compared to today, that is you should still have PNGs instead 
of SVGs. The overridden supported image/figures types are stored in 
conf.py at the end of the file, I don't modify them so should have the 
same behavior.

> were issues rendering SVGs in EPUBs as per Michael's commit:
> 
>      conf.py: use PNG first in EPUB output
> 
>      SVG directly included in EPUB output has multiple issues,
>      in particular font size and alignment ones (tested on two
>      EPUB readers). Instead, using PNG, generated from SVG when available
>      as the primary format for images. GIF and JPEG are fine too.
> 
>> Ideally, we shouldn't use our in-tree fork but the upstream project
>> sphinxcontrib.rsvgconverter, though it currently only supports
>> generating PDFs from SVGs and we also need PNGs. A merge request to add
>> support for this is pending[5].
> 
> Are you willing to send a patch to OE-Core to add a recipe for it?
> 

Yes, I will need to figure out how to build and test this docs toolchain 
first though :)

> Otherwise: I'm all for using this instead of our Makefile rules, this is much
> cleaner.
> 
> But I can't say whether BSD / IANAL is fine to include in out repo though. I'd
> rather have a recipe for it if possible! (possibly with your patch on top, if it
> doesn't get applied?)
> 

No, I will not do that as it'll prevent us from building without the 
docs toolchain.

If we want to fork the plugin, we'll need to have this made available in 
a publicly accessible git repo (on git.yoctoproject.org I guess?) so 
that we can simply pip install the git repo when building without the 
toolchain (can be done in the Pipfile and 
documentation/tools/host_packages_scripts/pip3_docs.sh). Then the recipe 
for the toolchain can be for that fork. I would rather wait for upstream 
feedback before this happens, hopefully all goes well and we get a new 
version tagged soon after.

Cheers,
Quentin

