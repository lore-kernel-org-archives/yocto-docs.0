Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119C6CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 12:07:31 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18907.1762171648750671115
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 04:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Fb5ENoqb;
 spf=pass (domain: cherry.de, ip: 52.101.83.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKsYBKqXKqQp8VQ6hPXsIT0aUMfYnfyrjy8VTJjZYuRP6MBI27ac5iVm3ZWg+60v92MVSKmau8A3XNESkOrS1d0DclXnjM18ziWSEz7ZoBLtIRhCIag+k3turwi3N9oayiHZANF3SlG22Rs/AnbDjPyz5AXxrbF4be5SN+q0adnFpCmTg3rLnxTDIIJtoS9FfwZuyCVSoNrOrpelMlDcSLYjmLJs7mmcZgxYB7gywqHOIfcjdyuGzwae8kPAgJCaZ7hTDvmZF0/aNIN4083Y1THYvV+H5E6jOTqiEfBb8oHg8dPQQfdLCYLTC1AWPXeYstmHqIWaYo+tkf0LTIDFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UsjuiFtRhxFSrFXxcFqE084cChQHg3oxkwzslAXLpQ=;
 b=GNWdvlGVuedKke8ZtEgJG/SriTysIn5TkbmqJ8IVUOFLLFUGcvI4tDJ6cU2FVkJXhVPQIP3IgPvDiFHniXlnXuJ05xm7CmA9FOOTcUELlorabyI+5LfojE1czLw0Vze90VL400p8m/7IuqtduE7odxZEwFleguWpKwyV6IXoErYXQ3EEd1igr8sKxl2G0Jt+C93edfxwgSrdxN6n0zld0iLC4UpaaQRhiu6wvp8TGFWivl1SO5Lxb6i2GbNxylK92o9SYEJYO/Ect5SyUczsYxlMVSACycqxWfIMHtXFwjDiggqZiGMs5OdVAoOq5PxYfJN/4gbVQOUsbZT9trRJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UsjuiFtRhxFSrFXxcFqE084cChQHg3oxkwzslAXLpQ=;
 b=Fb5ENoqbl4cX2UvP8omT8Pk7wtrj+Iwd4unmiRZTvHpYhpmtZyOSzj+hWbnsq2YZNFv0hFn/U8d3A0iIwlJc4elFKzaf7U2guCSShL5d2tXNEuCWfiO/jT72ZI7qAQx6mUW3s+jIMWt/sJKLkAO/1/qI+Sewc6p3175G5TsjITQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10349.eurprd04.prod.outlook.com (2603:10a6:150:1c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 12:07:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 12:07:22 +0000
Message-ID: <f3d9afb8-e6eb-4a0c-979b-45c58fc3329e@cherry.de>
Date: Mon, 3 Nov 2025 13:07:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] does variable glossary identify wrong default for
 NVD_DB_VERSION?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <de0afb59-cac2-2267-6d91-33c1eecb053d@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <de0afb59-cac2-2267-6d91-33c1eecb053d@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10349:EE_
X-MS-Office365-Filtering-Correlation-Id: fc996336-5bbb-4548-45df-08de1ad18b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cnVueWlVb2NRVngxc2RndS9qekJhdG4rVHQ3VTkxVW5FM3J5ZjVTSENPUnRY?=
 =?utf-8?B?ZGVRaWlaVzV2ZkRzNGMzYzhvWFhLU3k5MTFNVWFmakk3VHlJclhCR1dKYnBW?=
 =?utf-8?B?TjRMM2dNWU9BSlRGRHk0MHRmeWFSTzdrNXcrTDA1VW1NQzU1Sml5QjlkWk5J?=
 =?utf-8?B?Z0tTMXFROFRaSXIrb3dDK0VlTkNPL2RpOTlZcHJyYmx1aDB3MTF1K29YRWx5?=
 =?utf-8?B?YTJqZmNtckxoNTY1OGNFbVFUR3NCblJRYUdGQk5aZXg2ay9HNU1SVjNmV0d0?=
 =?utf-8?B?M2o4ZXBYejUxWGVXelVJdXNRNjc5aG5QdWJNcGVrWFlNUC80bHhiUnpacDRW?=
 =?utf-8?B?QTdUcjNTRGdzajFKdjBCMk8yNGZObTkrK2xWUkN1Zm1NZ0x6UTlLLzJNd216?=
 =?utf-8?B?RXJzUGx0RkZNZUtkWkNFcVMzbW80cGMwREJQOGs3ejR1RjFkMlV6OFRoMWFn?=
 =?utf-8?B?UHFscFp5RXFiTHk1L3M3TDRrMkF3SmlpdFlYeGZGaENWSkJUb1RaNUVRVmJE?=
 =?utf-8?B?Wi9WQk9DK2NsZ1JCYWwwWUxoN3RFVDNCRFpFRHpScnRaa3k2bGdKbytpSWN1?=
 =?utf-8?B?VExEREc5b0J0SFZqbkhUVWZPUFVtbjlEaTV5TnQ5WDhGdXpzN0F2VHRQSEVP?=
 =?utf-8?B?UGlOUXorb0VaMnR6WUJRcmh0RzYvaEFvQjhzQ1lKUGVlVkFBSmJHc25LcWFt?=
 =?utf-8?B?YlJJTTMzNlBwbWhLdktVaEpOWUtaTGN4VlEveEg4a2xtbzVYTXJQb3JQc1hs?=
 =?utf-8?B?dEVtV2FDV2YzYTh2Ny9SMUJ0ZmQyZHhET1JEcmI1UFFEdmxzOW5CUVBUd2lQ?=
 =?utf-8?B?d3JFL0Y4ZG91SnVsUkZTUGk3Y2hHUFcvOWlVQ1doNDMvT3VxdkM4MWduZEZ6?=
 =?utf-8?B?endQdERlSUZFSXArN2hmOVZHK2h5Ykx3cmlibmN2cGg1bEZyMEMwaExnZWNi?=
 =?utf-8?B?dVJERVVaNzBoVkhDZ3lHcUwxbnhWcy90TE5QOTN1OEhTTEVrMzRCS3BFRHBV?=
 =?utf-8?B?cFN3L1VuWXZSK2RXUTdlMDM5K3lzUE9KSC9MTTdWWU5sSHpRS1VOaC82RXNq?=
 =?utf-8?B?SVc5SjludU5VRlhTSklKamo3MzZXWHJjQ1lHNFBqVzJPVTQ5eFlxOFhFSEJD?=
 =?utf-8?B?MkRLNXFDVVRoWGx0b29ONHc4UExJMVErUDN1bk02VHhxbHlaQjRFUFN5YzRa?=
 =?utf-8?B?N3JLNFRRcmM1NjZqellJQ3VsYUJWVHc4TjYydk16MXlLMkExOVlCeVZ4RGxi?=
 =?utf-8?B?QjROL0hjTXNIblBjeDFSNGlwbDBweXc4U3k2SldrcnE3LzZlTnE4akJ4cTEy?=
 =?utf-8?B?Z1RzcDIrTVFaN0dNVnUvTzNNL1V0SHVIN25ISVZnck92VDdvQ3lEY0JtT2tz?=
 =?utf-8?B?dTRwN1l3Q2hzZFo4M1UvRU1lTEFXREdUanc2NjVjUmMyY0MrbnF3aTdrMko5?=
 =?utf-8?B?azVGLzRVT1JkNThiYTBLcXA3cnc2bWlaVTdEWW1NQXVaQllQUmwxOTB1TU9W?=
 =?utf-8?B?dWJBbjduWjNlMUovWjdRcjZBMElxdTBWUW9wb0ZxYVgrREI5Ri9tSk0wM2gx?=
 =?utf-8?B?cjFUOWxFQ3o4a3M0ZzF2UDA2VzkrOU9hTzFQbmlBdXJjeWltK1Y2VDV4Zndp?=
 =?utf-8?B?YXB5aHhtNkFKVWg5T0lMWTV6eC8yaFVVZzF4dTNpQ2JzaVRYMVRRbHZpQTMr?=
 =?utf-8?B?eVMyelQ4cGNIZjdCTXg2cFJQbjR6R1VBU3c5ZXpoVS9xMWwxZ2JMSDR5Wjlx?=
 =?utf-8?B?cldGZ1VwNlZFSEtyTmtLVXBUbmNNN0tkZno3M0JjUGtKR2RMUXBQODJUMVhv?=
 =?utf-8?B?TXJvQTg0bmZ6eVJuY1hlR1pkMTRNc3AwOGxYOFpHYml1bjg2TkJrc1grRmxv?=
 =?utf-8?B?a2lTdkUxbURGczNQS29OVE82ZXljOTVUalh2ZlF6eGplWWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGNyTVVza1d5T3BjSTZHZEpPZkU0RzJudFp4eHQ2bllmMGkzUDBJcHBIVHhU?=
 =?utf-8?B?dldNZEpGbkhHWVF2VjREL2VuMERxZklrdUFWNG0xTWJhTGtaWU1QRmF3dlZS?=
 =?utf-8?B?ZDVyM3dSMHBsWHdWK1JLQ05TTE9YZWt4RXcrTGpBMTQ2QlNUVzlCd2FaTDkr?=
 =?utf-8?B?TzlrNENJM09QN3ZZWUJ0a24wSXVURVd1TWlMYTlsMGJzN3FxdzVIOWVKWnZn?=
 =?utf-8?B?bTdCSFUva1JKY216OEEwQUJ5NHYxM2lzZzI4cEFpdFNWbEw3SWNCcmNHaTZx?=
 =?utf-8?B?N255ZVNBQUxlakZKYWVYVnljdlI0UnBVRUt4SzE0MWtLSUVuTFFmeE1zY0tr?=
 =?utf-8?B?S1lkRzB6TmhpWUJFWlBYMnpYYXplcGttNFJKUFNySGQ4bDkwcmNKRzlhdGFS?=
 =?utf-8?B?V0Y0ZGNnaWxraDV6K25ucVV2Q2FwdElpKzM0alFHVjA3L09LVUc2QmljQjhl?=
 =?utf-8?B?Qldhdk1PRkhyN0Z5UURJUVpVNjY3NzBMWlMvOHo0T0JwblVZQTNZREV6aytQ?=
 =?utf-8?B?MUVwdmtYYW9lcWE3TVBQeFNjL0o5dkM1TldLVUdaRmtVR0dIbHlINUp1Q3Uy?=
 =?utf-8?B?V01DaXlLcklIU1lySlEydUNZWDBhcDVINmthMG8rT2o5TWhrOHcwTCsycVUw?=
 =?utf-8?B?NlUxT3krakZrQzlDaTloZHJjTkxVeTNMdDIrRFRZZ21ZcytyU3RuR2QveVB2?=
 =?utf-8?B?TlFhZzdsc0tFWFJSK3VVMXV4T0Q3UGV2WmJLY0MyWWd6QVRJcjAxazhWZnVy?=
 =?utf-8?B?VTQ1NkJvaGxmS0FzTlRneDJuTi9TSjh4NGhYalc5ekdMU3Z4eHhMUVVlUnRK?=
 =?utf-8?B?Z1dMWCtmQXN5M3JiZGRSTmR2ampKZkFWdVQrWmNZV0pXdUV5L0JPdStnK3Ry?=
 =?utf-8?B?ZFkxM3RPTEJaVkdFZjcrWllJVU5idS9wY1JsN2pyd2lmemlhbFgydnRSUUY0?=
 =?utf-8?B?RkhPZXN2dFBzcnFsSlZRclRqMFE1V0lEbzFHeWREdFc5V1Iwc3dkZ1Fqdkd3?=
 =?utf-8?B?WGgvYko4bmwzcXAzZnBmUGxMQlZ2MXNxb0UrNWRYdWYzcHRtVnlDTzJ5Z3RD?=
 =?utf-8?B?YlZhWmNjL1B6am1qQ2VYckhzYWJVS0djVzlRYXl2RnlKTi9QQ1Fyb3hEcXZQ?=
 =?utf-8?B?REpud3dNOXZTUmdJM2lsdGN0T0M0Vk5JaEhmQkx5LytHWVhrbFpZemdkTlkz?=
 =?utf-8?B?d3U3KzlvTVlCSS94cmFxWjNhd29DbVYzdzUxSkJFR09lZ0lWRlF1cU5kMEF4?=
 =?utf-8?B?OFp0MlBUSTVkRDkzS1d5RUhPdm5hUmd1UVVicHhVUFJkMDhHZjRjTlNVeVhm?=
 =?utf-8?B?Rng0aEh0dUdpRXFya1hwaEZLektzelRxb1loUUwzQ1JwMTY2alRBcE9xMStZ?=
 =?utf-8?B?WGxQMlpROEdkUDIxNHk1dWN4QTFsOG9FL1ZFZU9KL205QXg3OFlhK1NkaE9V?=
 =?utf-8?B?RGpYQzN0MVhZZ0s5bmpicFJ1dS9wczVmNEJKeU9mS0ozZU1pOG5QY0lKL2gw?=
 =?utf-8?B?WWNHSE5MdEVqa3h1MEZicGNmS293eUszeW9aWmZuTXAwOG1PN0VuVmpScFZm?=
 =?utf-8?B?YXBXUUlQYVY5SDlZcXZzNnZ4RFRJNkNucEZZNmRLNFZTd3UyelZDZmpleEN2?=
 =?utf-8?B?RlhVZ1RDWFl3THE3aG1hQ2poRHVjMEZTZDZSb1Qyalh6R1dka095VGlKQUJn?=
 =?utf-8?B?L0ZqMHZKV0V6c0Z3eUhFV3NOUG1YOTZ0eXlEQXhyZks0d1FJSEN2bk01aWpK?=
 =?utf-8?B?aFZTVUc4ak0zaCtBVkJVakRNSndzRUp4ZUhMUUlBV0hlckJBcjlSMEhQVmxL?=
 =?utf-8?B?NTFUbkxqVUxwby8yTDBwK0hab3FwNE1ydEFDMncyeGdZVDYrY3BsemhLVGpi?=
 =?utf-8?B?S0xQc1VHc3JUanExQ0F6K1VHc2dNMGJadC9EUmV1TFJMRkh0ZHloU25EdWMr?=
 =?utf-8?B?UTFGd0lxaEZESW9sNU5HN1hqUjRNYzJjVVg3bTRJWVlNZklrQUlxdUplNkhK?=
 =?utf-8?B?aHZ4T21kNisrcHQ1TVFybjZ3MW5pZk8rUVNDMVg3ZmNadm4ybFQwa204cWdM?=
 =?utf-8?B?QVc4VWZ5OWM0Qk45RytMbXBOZ3Q2UjE1aC9GMTF5MWpsRnVYK2pKN2ZCaTRy?=
 =?utf-8?B?NWdXUmd5V1Baa0NMcHhCRitDYXphTnZ2TUw5U3J3ODNEemM3TXg5TkVtbEVU?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fc996336-5bbb-4548-45df-08de1ad18b06
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 12:07:22.1120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIGrmplk3S9esUespBMr6aivdlyHcbmFnX37XuDH+3KBWtE2tdwu0S9Rwx2L+PBTrjnGJ54gmSFJytS8vHv62HQRdi0mM47QWACKXcIbQqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10349
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 12:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7970

Hi Robert,

On 11/3/25 12:59 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> here:
> 
> https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-NVD_DB_VERSION
> 
> we read:
> 
>      The NVD_DB_VERSION variable allows choosing the CVE feed when
>      using the cve-check class. It can be one of:
> 
>          NVD2 (default): the NVD feed with API version 2
> 
>          FKIE: the FKIE-CAD feed reconstruction
> 
>          NVD1: the NVD JSON feed (deprecated)
> 
> but cve-check.bbclass suggests FKIE (not NVD2) is the default:
> 
>    # Possible database sources: NVD1, NVD2, FKIE
>    NVD_DB_VERSION ?= "FKIE"
> 
> i don't know what might be happening behind the scenes so i am
> *definitely* not submitting a patch. :-)
> 

https://git.yoctoproject.org/poky/commit/?id=8e11797a563066da97ffac639d3173281a8c1ca9

The docs patch was sent before this got merged and this slipped through 
unnoticed to the docs people, please send a patch.

Thanks!
Quentin

