Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F55D41159
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:06:12 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32268.1768471570955762359
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 02:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KavvsBx7;
 spf=pass (domain: cherry.de, ip: 52.101.66.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFGwwfAyzh0lelMtKpcGfIgo5rcizlScEFJ01vQBS27z3C5RS0gKgeqibG+E47TtgEuyQxkY9r1VLMbKkePpihvFk2BAG7TDTweuBjO+SUUXc8nJKiWGJoZnQGY+8vV5X3vjEhDnHEwfw9eA7P3gJxMXnLCq40dTlvgZJJG4lMEeZv2HE5KUQnj1hR410ue74s+rcSChcmDWDyThQeEv1BizjFWgIUa8D/cf4ty+vkOGM7hZM7fXik1JIUHubEQpIdDGstk6XWUrHu+kqQHg3Bm4hIrVvsKW/o7a+LI71CyNB9ugGREFNbjEgYoDR4Eo1Q6xnFjeAdwhDjYrdepiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEn1YxpXEh3m3Q7PhhGAb7LYAuEPGdCTd8XEzLAQLRk=;
 b=diL+cTcL4kwW/YDBj15ZJKEB2eTdK/XaBDHB31cWLImRtOjgFg3P3mW2MbYhaXyhT7BNZE/iRgv2SdCsvt30cNECLPeMJHwWt82IhWno79OU4nYZKpSQkWeuiLKznyBrL7TvPrJOmifj3NaSUS4E6Mq44zSlkQ+IeU4+gr6mfThBNWhIbfk822nI9PmCOL2/rFUri8lHofrKEPHIGktGB/fuUkP6y2qUU3T6a09FTaah5u1+SWmwv8y+OBGu7Ha3XWimc5HX6jv8cS/7obtbWswTflBCwxSt7J23eLsRM/1aoT4FQT1Vu4p6lv069FPgFltQKxDi4p2OyUP5QaBaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEn1YxpXEh3m3Q7PhhGAb7LYAuEPGdCTd8XEzLAQLRk=;
 b=KavvsBx7YYN/TVjqp9gQrjdTwE+EWTJrn12GL9NEHE4ONpq/qcLAQ9k/1SW1ApLNPmNypuMoGvoR6EC5IYApIy6E1jbBvO8vtq1Tkn/cdYybM0pvbrI7PUkmuNd3aTHKpG1G+hJm9dVRxVcHNc0Y8PnID9dMBjQy+dgXTey6yuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10405.eurprd04.prod.outlook.com (2603:10a6:150:1d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:06:03 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 10:06:03 +0000
Message-ID: <78dfab73-8d58-4cbd-b452-d34c1cc14ae4@cherry.de>
Date: Thu, 15 Jan 2026 11:06:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] is there any way to render content in italics in a code
 block?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <5eef4c2b-95ae-cc22-b44c-a03e29982c79@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <5eef4c2b-95ae-cc22-b44c-a03e29982c79@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10405:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ff1825-074e-420d-06be-08de541db0ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dlltdVpFd1dPWTYxTU9lMWw2REZiSXpsZWFCSVRjanVxdGxKdWNmYUNUd1Fl?=
 =?utf-8?B?UGNybGdZcGJiaUFST01zVUxXUVlaQUYvcHliVEd0biswVCswc2N2YXRGTlgy?=
 =?utf-8?B?T1B2anpBYzhRazAzdnEvTEF3dUFISC8xWnRlTGViRmdwZlMrVksvTExmWnBU?=
 =?utf-8?B?dTRjVEdGVmoySGhYQ3E1RlBhdjFUZGt5TEZGQ3RBb0tHZ1NCM1RnaFR2d1hJ?=
 =?utf-8?B?KzZ1Zi8yQ0FkVXFTSFFHUC8vcjIvQWtZcnk4Y2FHdWFDOXdyemtYd3VCZ0hy?=
 =?utf-8?B?cTU0UmQzRlk4ckZ5dlp4ZHVTYWthdXM2ZDVXS0lkQkl6bWMxQStrVi96Ny9J?=
 =?utf-8?B?SlVlSnM0K2V5dEVnVk1YTk8yNmFHSnE5T1ArNElBSzdDd2RnRG1tRnRMY0hB?=
 =?utf-8?B?bUlVTXF0V21UOU45b1BvQStRREVDMXNCMTNwcEJod0dmYmVjNmtGZU9ZQ2Fy?=
 =?utf-8?B?dUt5aFNQcUZoZXUwN3plZzhkNFpjOTE4K0tscWhIZllFWFFWL3RuMkVneGNw?=
 =?utf-8?B?dHZwUW9uSEpXUmVBbzhGb3dlcG4yVU1OUUc5bUVGRDhDWlFtN29PQ0UzeElG?=
 =?utf-8?B?OVBaVVAxYmJiTnFpbXI3M0JKdm1lTkh1UFBLOWdUbW9tRVZid0gvNko1QnZt?=
 =?utf-8?B?ZmszWUowUGppQVVSbDBiUDNETGZGTzBJMGlHRkZmU01KdHRNTXZUUEVuWjZi?=
 =?utf-8?B?NTN2S2F5dC9mK1pMUmZGVGxKcXhVZEVVZzlzaXQzajFVdCtZaU12cElvaE0x?=
 =?utf-8?B?S05yV0VFVEJXTmJoMUx4aGRWeis3RlBBdmdBbFo4VHBkQ0tIem1XTlN3OXJl?=
 =?utf-8?B?UGFHQkQvM2haMU9CTFdIUERHODFUcTEvYUdWT0M0TVV4N2xLbjlOSHJSTTZx?=
 =?utf-8?B?eDB0SnpWZGVFN1dmMG5jVElOWm82b2lmS0V1NnJLMFhOK1p0YmdPL3pwK2lU?=
 =?utf-8?B?cUU0d0h1eGFsKzVxc2ZXRzExQ1R1RVFsMEdIeWFUd2w4TjlESmM1dzlySFls?=
 =?utf-8?B?R3ZzT01SeU1IK0crME55MWcydW4wRTNnSGlVZUwyaGtSYkRvQTRidXNncDJM?=
 =?utf-8?B?MmJ6d3JYaVJSVGdtdHdaSlhncjQ3NzJiOVROVldYOHBycFM1emdvSkNaRGxm?=
 =?utf-8?B?dUxMWDhXTHAwTGozaXQweVNEc0g0Y2xmNFMzL2h6MWVYU2FnUXJQYzFENitx?=
 =?utf-8?B?cFhRelhXR0dvRFdnQ3hGemdydmcyUGZVM0lFdGRaOVM5T2pkdlNzNEZqb2xU?=
 =?utf-8?B?Z3FKRUpxYnBQTlhUcU9GUysrZWlHQWhFSzJlRDdLT09SMzk3VEtJYzlZTzQ2?=
 =?utf-8?B?eGNzZTVHbXFFdWkwNjBqcjNLME02SUtsK09ncFk5cHVvaitoMzhpRU0wUWdy?=
 =?utf-8?B?WW56bzdTU0EvQjJKbmhFelJ0Rzl6RmFnZnF5d1BHRENiNDlvZWNxQTZrSHdY?=
 =?utf-8?B?WXlXVS85RXdNcUpUUS9PYkdHQThzMWJlNG1BUk9wNEE0ZFJQSkVUOXpXK21k?=
 =?utf-8?B?R2l3Znl3QkRoR2xWbmhrbDZFaEpHcU53Y3MyQ3FUNnd1NnhGMzJ1Q1g3VkVy?=
 =?utf-8?B?L0p4Y2txeUdMMFFaV1pPcmxVRS8vMEc0S2U5dFJjUm9LbUZRMG9jK0RnNHVw?=
 =?utf-8?B?T1JXY1FUczFqTmFjaEp3MS94SkFTSzBOS0tyLzlPMzBzWVoxRnB5ZmZRb0RU?=
 =?utf-8?B?bW1MKytXUy9KUTcyT1BjQXB3TVNvbmRFQ0U5OXQ0cUplSVRDcVE1WDd5QlJT?=
 =?utf-8?B?b0F6QmZDNXl2VWdlS0krencrNDJHNm1QcThjSUJaUmpkVkFjYVgzeHptNlJh?=
 =?utf-8?B?cUFabkxDWGtDNXJRVld6NXNWeGg0RFhWUWJPMTFGeUgrSmQ3d29xdkVPMWRH?=
 =?utf-8?B?U0RrK0NNS1lycURKZCtJODdtU1pYZzlLd1hXOWlLNG9Ld0VBMFlYejh1OVNB?=
 =?utf-8?B?Uk5XV1RDRWVxOGFpWTgvZHIvdkZaYllDdWhSL2VTaUV0U0xYVDR2ZlAvT28v?=
 =?utf-8?B?SW5LdnVmaTlxMEFOay9Hbmx4VXdKcnl2QkJrZldnZ0lEVmlEcGIwSVpuY0Rt?=
 =?utf-8?B?QW9taUFCazdCanRqTTIzTU9nZEhXcGRFU3dsbkI2UXcxSmhvaFd5d0w3aE9t?=
 =?utf-8?Q?ki74=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTVPeEdTUTE2dWRZUldWQWQyQUptdEllcHZ5QnNBL01COFFKTW1kR3RGQTlT?=
 =?utf-8?B?QU1jcFFlMWNVUmo4bFBPdkFtTnNBOWQzS0cyREV2QjNWQkUyWEdDK0RLNEQw?=
 =?utf-8?B?TDlIUUFFQ09GZFZ1dXM4TE9VT2JPSy9KbzhoRzBuK1d3Mmx2WmRJdHY4RlBr?=
 =?utf-8?B?OGVNc3FtNnpUUGNwM0doTWZodkZTQXBzTUkyeEJJZmlZaENQSy9jQWNsekNL?=
 =?utf-8?B?SStjeXl6cGY5YXhaUjZhdlYra2FSMUxQQUVBdmJkVEtxQVNmanlwejlQU0t4?=
 =?utf-8?B?bElCOGlZMVAwb3N2Tm9zTWJRd1R0ZFUrTUFETGpNTWgwZkRuSVlaYWk5WTdz?=
 =?utf-8?B?QkxtWjRwNlVxNlZXcDlwTDdtMG5tVTVlNVQxckFVeGsrY0FXb1J0Wnkvd1Zk?=
 =?utf-8?B?Vkh4N3dOSzZZMDBXUDZkczdqM05YT0UxVFh6dXlWbVB6QnFzNkdTZ1c2WDZj?=
 =?utf-8?B?eGsrMWU5WXhZZFRzNWdzNHZRakNGcUNyTTN1Tm9wSlZkOFNJZEQrSTc5elF2?=
 =?utf-8?B?S2I3d2FyMDl3cjFzbS9Ra05LeUwrVUFHZVFKT1hIUk1lRi9LM2RaaTZGSSsx?=
 =?utf-8?B?b3pKYzNnRDhQSUxYYmw3bVdrdDFEMjFmMU5FVFhrNWVqeWlMRmU1OUxZc2Jn?=
 =?utf-8?B?ZDZFeFVtMmY2UUZFU0hUYWdjdUp6UXNsaWVaUWlIZ00weWh1NjdmQ3RVazJR?=
 =?utf-8?B?SG1MOVB2SS92WVh6QUZNbkhwUitpRzJ5Y2w4QXlRSE1lcWFqR2ZHVXlDYkRs?=
 =?utf-8?B?Q3NqeGxKQlpMYVhNcGlSeng2MittMHl3c1R6enRDWnVIZGJZYU9OMXVVL2dl?=
 =?utf-8?B?cXl3Vlpja0hoandQK0liaGVZY0F6K1psUHVOczNLT1VRcmt0K0oxVnNWeXRF?=
 =?utf-8?B?QUhZZ3NTbTN0am8rK09sZGxYZkZKanRVN0NZK09aUmpKQTB5bGNJcTdBcUYv?=
 =?utf-8?B?YkdKVnpXUTkvS1pJc0ZPODdOTktwWlN2bnNZcnAwZlQrRWxtRmpkS0xGamFY?=
 =?utf-8?B?MlBtelBnSE5rNmwvSzZic3haUGdHdEUveEZiTnZLdzE3THNWVzBWdVNRbElr?=
 =?utf-8?B?cFljWjFzRExmNWFXdHd4dnc5WVgwcEpJK3pzVXZmZXBkRGFxNkZReTJicms1?=
 =?utf-8?B?UUYveEZIZlNaTmh5YzM2bXdSZDVmczhKck82NDRaNmZRNTFEdnVNeHRCSklk?=
 =?utf-8?B?L09qcVN5UkxTeXluTGhKR1J2NGxQdFpTZmJPSWZxR0tTUTljVWJOL3hxdVdY?=
 =?utf-8?B?eVNVNTQ4TG1pcVBVcTlYejVxTno1azI5T1NYeS9yQmtFNWxaaWZ4WDM0OFdI?=
 =?utf-8?B?T3JrZGFWam9Ob3FGYWY3MktobEp0TEdvWE5pYnVjelVRRElCN0krdUJWckZr?=
 =?utf-8?B?MHZYV094WWk1cGh6UmVXSUxKQzV5c0Z1akhaTEt5MHhXWmJJS1lzR0VWcENj?=
 =?utf-8?B?UG5nY2drUE9lVVZOMWVnemFwZFIzb09jUVdsTDFvQUpDdS9YS29RQ0U4eThn?=
 =?utf-8?B?MWszV0p5MDQ5L2hZUG13NGhZdS85VmVlNHNzRGVBV0g5a3F5RStGSmxjL1Ry?=
 =?utf-8?B?TG91SGdjQ0trSXJWRjNUUnpyQUtjUUJYUjVRREhObGZWZFhPbERHYUl1d3BK?=
 =?utf-8?B?UHZVanQrZnhYMmtjVHdjSkYxLzdpbE5NU1o5elJtV3JpbWxRNVMxMjN3QUdz?=
 =?utf-8?B?RzZTNlZWUlRDVXk0ZTBFbXR2dFBoWGZFTjEwUkdIY3E3S1hHcTVwY29FYjZS?=
 =?utf-8?B?TjRJOUNPVjBYdVBoQ05GcHZqalhjYXZHRE9FWjF4NHp1TnNGcUtNbVFWc1Fi?=
 =?utf-8?B?OXp0TTFobVRNa1A4MVdDOTRwZ2lDN2dldW5YODFGTUJ6TnhpMERXVjJBY2NP?=
 =?utf-8?B?dlkySndKSmptRVpqOTNLd3luallxTjZEdncyVXZmY2h4SDhiUFBsWnpQYVpP?=
 =?utf-8?B?YkNDNy9GUDZTWlRUbmN4QkZka1M2bVNMeTJ4SWFQamd4emVDQmNXQWJTd3NB?=
 =?utf-8?B?TTFVYUc5R0hRRjRNYWdsY2k1SmhKamx3Y1VkQ0JiRGxTbTdiWUJCT1BET0Rs?=
 =?utf-8?B?cWNITTJnUGhMRGdBMlBGa1poOUFkRzVERWdVQTUvUnVOMHd5Y1B2czJlMlN4?=
 =?utf-8?B?SWV2MUZqVERHN0hNUVpBV0w3dGFwWFY1Z0h3S29wYStkaU0xclk4QWNtTXNu?=
 =?utf-8?B?L1BqZU9VNDZ2aCs5QlppZ2hVQnNtc2xVM01XbnNYSjh1aXpsV0lPTkxHYjFJ?=
 =?utf-8?B?aTFCa090bHRjd3g5Sk91bW9EVHdHVEgwdi83RjFEd3R2M0srNVpKYytwVkFw?=
 =?utf-8?B?eWNadkVhSXVDSEt2V1ZRUVptR3VicElUTlRPeHBDOSs4Y2NtdEZZdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ff1825-074e-420d-06be-08de541db0ae
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:06:02.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VofMsGjUe4aNvIFPW+t0aLmYBGUeuvEH08EBHqB4YgpMKnQeoawygkFEP9wyNN5HdtZPhL4caRxIL1Kn5LQiPNLTppjohPTMtveddHeHyiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10405
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jan 2026 10:06:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8567

Hi Robert,

On 1/8/26 10:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    one aspect of sphinx that gripes my wagger is that there does not
> seem to be any easy way to tag something in italics in a code block.
> 
> here:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html
> 
> the code line:
> 
>   $ bitbake target
> 
> really needs the word "target" in italics to show that it's meant to
> be replaced. and, no, this isn't minor nitpicking -- the whole section
> on overrides desperately needs to be able to show what things a
> developer is meant to replace.
> 
>    is there any way to do this?
> 

Not that I know of.

Another option is to follow conventions from manpages for example or 
something people are most familiar with.

bitbake [target]...

maybe? I'm not versed in manpages.

Also, you can simply specify after the code-block what must be changed 
by the user. It doesn't *have* to be a technical solution.

code-blocks have :emphasize-lines: maybe there's room for adding 
emphasize-columns or something like that such that we can specify what 
to highlight in a line.

Cheers,
Quentin

