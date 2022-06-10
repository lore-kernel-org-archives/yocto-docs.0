Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE51CC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 14:41:49 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.45])
 by mx.groups.io with SMTP id smtpd.web12.27698.1654872104526983147
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 07:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=QVl3sXOM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.45,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeSwASAfRdJHSSpIAHBAoCaUDSGj101ig8i0LOpXywnje+VfxCmNce2WhMoFEq2qQqwA2Bzipv1hxu7M6m1dHG9JiCqFmHojlHgv/6IM8mwQPUIQ0ESZByT8+aYN2I87u0gzM02ZaTm1AkSORMzOvYxTd98fA51CUhhpiKIZsJ71ezqYW0CIjkLetRu350vUrJDf+3S0eu9dvE9d8HGsd4s5kdAUrIgZCINF1rmf1rttbvdhbmO/+VXcL/kR2OVray86PM7wjeFi+corQAvnrOrhkIZoKPrTW2OIE06b94djEw6fKNLLpizmlaa+A9TfKupz0lKUts+JgH/wNOPXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJbW3cpvQQLztEUhrtYR6SK/FJZ2682eT3F+EuY0HCA=;
 b=ItT+R4rPKe0MwGpxGQ0sBFSmVlu8BM0GInu4bzG8/ZA3tpvT8lVI277m1+trkOPZFEzUhXmCOnUaLxdnORwAAvrB4hcB2NjCv4I7wQ5SyxQXcHny8qNc5u2a0LOalVIAYdgZ1dNsaKHbiwRVWA+OLZJ4grgbIlZEz7Gn6EA0fJDR91wXejRQb4IRXTy2pm9b2+TEcmFq0C3Gapq8F7d4lWSmvtY0drmRCxrUX2beH24Mu5vlpdvlgW2LY+ASwmwlcpM+3BkaYOVi/F5I4jG4lYPntNwHjQ5iw3bnz71kdqK46IAGpqjpH6rA5rraaJNSRiDh5iJ4VvSBhqGE3LagpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJbW3cpvQQLztEUhrtYR6SK/FJZ2682eT3F+EuY0HCA=;
 b=QVl3sXOM6ixUxYcxKldiCYGdq7VXoUmIZV/SEX1J9a7eb1P4CD10ICZzREkrZj70/JDLHpMnjVvaAUlB7+RSRzi0ssGQE8uhB+Dog87vSrzxEF+veyDnuNPtMjKLqoYX4N8PLtS78uoIE1bK9HOubQOmZjPeiPeOWk+5UwuqRWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM9PR04MB8554.eurprd04.prod.outlook.com (2603:10a6:20b:435::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 14:41:40 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%6]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 14:41:39 +0000
Message-ID: <8bdf4db2-03da-fb6f-a6e6-1c40c7f4e47e@theobroma-systems.com>
Date: Fri, 10 Jun 2022 16:41:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [docs] [PATCH] Revert "docs: conf.py: fix cve extlinks caption
 for sphinx <4.0"
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220610143401.2239827-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220610143401.2239827-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::32) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31518f47-1850-4656-8614-08da4aef5444
X-MS-TrafficTypeDiagnostic: AM9PR04MB8554:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR04MB8554517CE08C12860DC0ACCDC2A69@AM9PR04MB8554.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dMJySc939gNXtyRiYSNLt8c1az8t0z7kDgpMXhgqt5KvYCRQ/5PxAwPkPF25nO0dpDQuMbnGpT7oCNtyMaDbPsYssAK5k/cyDqmbGuRDbBTgn0fOEmHQQhaWQ8kBNX2Wh4Mbe+bPCiPaY244B2Ck02e7dVdp8AnQJ8y8fTIxPLc/ACW2EnVdxcRMk3Yb0+E369vr2IKAMbUpOZFDw85ESl4Gls5id/Wvpla2YRhaIRhDIDyXM6rI/stnXfIUG6AsGUeFmzwj8Rsm9VuQ76jtXCy5MHZzohSoNsuX/jgH7vuhcWsKpBg0yOa/vBUkdP+keB0n2L1HNj0NVAMLzmVsfrW6MOB5rTyJ5AeDu4QSSoPv1MqlvBRfe9Ck67mj/qP4/JwLvNltgEJlYgif+8Vbn/UKvB2wSLP0F9b9HjzWy+NopD33CMaUCtMjGvWjwB/PP6BJowlyuQgmoFrg7KpBbVlC3s0JZ0lHU3zcf3L4Grv0RVQU1exCLZd7axdeMzdIhOe/Y41FrU4clPpXMK9tth3/QU/i1ABgUvutpduj5oWiELq0K0xGBSDBiNpN3wcVzrgu6XFkO6GqIJ5XGwf9DO/NBT/MvByME96+QKYz+MOhBzSk2ZWN+atyKgZlxAqaMtHakfmoWkGpvG3OEoXLb1hnGlQs8rRlDMkTCac023WQ1bLUrN0eyGM1tnZEJSW2F8pIrjgrt8mB1T0hplDANwVBcuc3+u5/2BP3FjSri03jQqx2VYtSDHlem7qOb3CsS3269vw6/v1a9luQlSeU+j0Tpx5G0LUe7tuVD8GUgE7wSgra/WIbjI1sOrIstEj8DMJd0K6m5PGSd7qtIh2zfQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(86362001)(44832011)(26005)(31696002)(508600001)(6512007)(966005)(53546011)(6486002)(5660300002)(6506007)(186003)(83380400001)(8936002)(2616005)(36756003)(38100700002)(66476007)(66556008)(8676002)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTFlcERVRHRjdzhjSlNLMUlpNlNiYlJUNVJ2QndUM3BQdlhHQjFtajJFN1RO?=
 =?utf-8?B?dWorVTRzQlh6SmR0Q1psYTAwY3h4SDdZNEtxNmVJSGdMcCtHY2w5UklFa0FC?=
 =?utf-8?B?K0wxMUZaUExzQVJKQ250VWpQNGlOSlh5VFg5YVVWWEpQRVZzTkZGYXRvaTcv?=
 =?utf-8?B?YnY5b0hNbldIbUdnUVo4UFZ4Ri9xUjVjbitkNnFVVFBMV3dTbzlCc0kvaVFu?=
 =?utf-8?B?Q0hoTSt6a3RXbE5YdEh1anp3VTdWVi8wNHJqeTlHUHlxcTBmR3ZVblBCT3VV?=
 =?utf-8?B?NC82N1pFbm0wdGdENGdoVWVLWGZlUlNVNWFHZ3BDQmdHTnQ1OU42cTJTczU1?=
 =?utf-8?B?THFxeWJTMXJrNjhXQURZN0RmSXNVL2xlT0NyVThmWTk3QlhCRTlDODNweTNP?=
 =?utf-8?B?NW53azNxWEZTMmt5V1lkWnRqem1IbXBCUVNFKzdmYmdmQzRWRWw1K200TnI4?=
 =?utf-8?B?WXprTUxDZnJTTzJIejIwWHkrcVVDWlRFQ2o4VDh5QVB3VkdGdDVrNkl6ejB4?=
 =?utf-8?B?S0xRc1puSlRnYkpIVFYxUWdsMWx2b25sTmRMQW1oeG1qUFV6SE9Jc1NKYTlh?=
 =?utf-8?B?eTcvTEhBM21KQzV4MjA4dVVwVkRwdm9EZFlJektQZWIvemZ1U1ZBSEkwZlJV?=
 =?utf-8?B?RXRUOTFNWWxZZTdLY1pYUldkWVhKdm5ZNUx4WFM0RlU3WGdNTC9JVUNwdS9Q?=
 =?utf-8?B?U2NwVFN3ZHFZVElWMktINW80aUNKekJwc0hNSTdJRkYxSk5GWDBBRng4U0NS?=
 =?utf-8?B?cUtFT2lzbWd6VW0zVzlWUHBZN2hFRmJRQi9hRU1vcW9sUnlQK3BWYTErK2xn?=
 =?utf-8?B?VllCMmFpdk9PbHVITFlTM1ZzclB0bHdsVHJwWkZhaHVESFVVQ2t2UlFMMjFy?=
 =?utf-8?B?U0craFZLUjlrOUpBdXMvNEt3azI4ajRBWVVKb3BNV3A5Q3lveE5qSGxGeDlQ?=
 =?utf-8?B?S0hCV3pvWElsRFpieHhNNDdIdzlIUytTQVcvK1hNK3RwbnRBOWxBc3RLVUxQ?=
 =?utf-8?B?eElFR3N1UVYwbDFvY2tHU1ZtOWJWK1FvczhzbUhoT1YzNG9OSXgxUzlBNnZl?=
 =?utf-8?B?ZHF3OCtkSm9YK3ROLzJtVW9pRHAvVU1rMWQrUWU4RWRFdDdqN0swQXZsZEcr?=
 =?utf-8?B?bTNWcmhMNHlYTk0zcUhPQ1pORUNwdlFGTk8rd0FxK2ZlZ0RQcDQ3MU0xdE9C?=
 =?utf-8?B?TzNGRHpiVEQyTHhIWGI1RzdpckV0Vyt0TmUyaCtMWm81a0tWMjlITTF0ODUz?=
 =?utf-8?B?MHdNMWJIQ2lFTElGTmlqWlh0a3hwSWMzREZCMWc1UVNzNzRxR2J6Zlo3eUly?=
 =?utf-8?B?RDR0Z2FFa1JwMHAzeitOUHF0bXlZQlVSbFBBWHo0UkVqS25TQ0E3S0pKRS94?=
 =?utf-8?B?REcxM2E4UlhCQk1UQjBVUzRVODE2M2hSOVUza3piUjlRNWFjaE5hWEg0b0RC?=
 =?utf-8?B?Q0gvM2ZEb2VqcGE5YktZWm5UTWw0Y09VMGVPQUxQZU5zMjFHNzZHZnNBbDVs?=
 =?utf-8?B?SnpjK1VNWEova3ZwdXBFY0pYQ2lxVktteTlLVHZFNDcwK3BCRjUvVnM2SWVj?=
 =?utf-8?B?U0w4aUZNdm9LVUI4RytGWGNXWjg0R2JrcHFKQzFjZzhDVHRwVFA5L1pacCtz?=
 =?utf-8?B?MExJWFBLdDJZR1NqalM4eURwQTZEQnFENy9VQjlNNXhRMnljaFNvRDFVQmND?=
 =?utf-8?B?UHZkRTRWaXdTd09mck5aOEZXMTBPclIwNjJpT2xvekhvbENtdG9sUi9BMHZk?=
 =?utf-8?B?YlVVdXFycVM4Vm1OaUFhekk1Q0dJVW1ldS80SDByTkxNejhURnYwekY0NGtQ?=
 =?utf-8?B?WmpteUcyME1OSlhrQkdrV0lXcHhIdDVISlJYVFBXUGZNdldoTzcrZ2lzRlky?=
 =?utf-8?B?MnFVNzJDMW4yYUlGZmtwaGViU2IwSFRMcjNEQ2VZSWRneEtoUCtGcXNCclZo?=
 =?utf-8?B?MFBUaUhMdng5a0c1MjBmdnhZQUJBc3liUmNVQU5qK0xOMS9EK0x0QlFOeW0r?=
 =?utf-8?B?Z29vWk5VdzBja3VMRk5ic05uTGV2V0lNU01pYUhXNlo1cXZ1VVA4VkJuNnM5?=
 =?utf-8?B?aWdCcFlQQURvY21KcGlISkZMcnRib0xQaDQrOXZkZ2loNWFGT1VySmhDL1gr?=
 =?utf-8?B?dk81VU1ESnBYdlBwR2FwQmw4U2o5Mk4yb09GM1pScnBEUWwySFAyR2dnNXI5?=
 =?utf-8?B?cVFnU3o0TWQydElUcG11cmR0YWlVQzF2OU9PMG1rdmo3cko0Y1c1Ym8rSTRx?=
 =?utf-8?B?d3k5M1ZKQklwREYxZFJFWFY0ZlQ2T0FJS2dhZVlCUGVrSERjOFNkb3NDbXdw?=
 =?utf-8?B?WHlVVXVML1pRSDMxL3lqUy9LTWJPNU1xNCt3dnpSUWZBTWpjcUxOd3RhL2dW?=
 =?utf-8?Q?ltHlaaSTesPL9M2+JHzF8anhJiUj6SNW5PyFG?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 31518f47-1850-4656-8614-08da4aef5444
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 14:41:39.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NcN3oxF00TP4iAmRSzng6GRFV470OLHK0fyRm9dAUFmigLHIRgj2pICURRiRp7trOk/6gILb95PLvb6z3++8j1jFxy3fyIVZFfVCx0fSqb7pp8gnVSsqW8PiyGFaGC0c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8554
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jun 2022 14:41:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2979

Hi Michael,

On 6/10/22 16:34, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This reverts commit c9922076f5c1285d9cfd6aff8ce5b6635d88222f,
> and allows to avoid this new warning which appears with Sphinx 5.0.1:
> 
> WARNING: extlinks: Sphinx-6.0 will require a caption string to contain exactly one '%s' and all other '%' need to be escaped as '%%'.

Missing SoB.

In any case, NACK until we use a newer Sphinx for building the docs with 
the autobuilder (currently 3.2.1) otherwise we get CVE-%s-<CVE_ID> 
instead of CVE-<CVE_ID>.

We'd need a patch that bumps the minimum version of Sphinx to build the 
docs (in conf.py, needs_sphinx), revert the patch and use a new 
docs_buildtools in the autobuilder. Without this you're just fixing your 
a build issue on your local PC and failing the autobuilder.

We do not have a "stable" release available yet on 
https://autobuilder.yocto.io/pub/buildtools/ so we'd need to create one. 
I know Richard made an attempt a few months ago when we added Sphinx 
recipe inside poky (specifically for creating the docs buildtools).

Nothing impossible, but, today, this patch is doing more harm than good.

Cheers,
Quentin

