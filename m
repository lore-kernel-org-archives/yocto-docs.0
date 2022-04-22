Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A4FC48BE6
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.84])
 by mx.groups.io with SMTP id smtpd.web12.7233.1650625830963101093
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 04:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Bi3I5F7U;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.84,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsZfWDw+C6bxapS7oVQpFGfQX0uUUt8rVfXbXAXDRiII/gxR4wygI/0yYi5oarqziaNAiFCK8pTqgP+K8vGNSO826r8qeWTdoA626+WyIxKuuVaBoXFEIw0ciBEovM15zLWQwJQilaxD8EAp3FUa9qK2hiY43pPyEjuIttekbyoT3SqCYbzYrfBIq8GNCpLKdYl6dXMjlFKSKZJ0GeiShtKeZFOsqHcM+i/q1cw2D44JdKc1LT8UCKNZFRcZSHQVMubskEKuoNIXqVMsVFv7lV9vCYs/EFPLdwsBXK2+QlrIrayvr2+g1eWbyAd8xR5geb6w6y2bZVcR9xsyOwZcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEt//7b0h+XfBwzDa0la5rN/Bqr1idRmr8Rb/IX1XU0=;
 b=a55rCJ2JgXSRLJDJsxZTtUpmn2zed3X18DP1bepptfnHvpM4S/iNNGkh0k5trkZgrOi4qZ0EaFec10u1bqN4r3LEOHZ45Tt+7xCY5L2HeY1B8G6ByrgxmN8mlrYagc8QWJHYY6cCPqb0x8uV1Hb8GN4s3h9MyP96oh1X0sGqNOyZruLMorXYyeE05TV33yzEwIyBjEbrX+Gg5BYpeP1P6oZNsWW47HI8qEG3+DsZe88a2sRgk2SAukhvYusf3O0afXZ4v/BS1dQXPo1HlkBewjCWEhEw/vM4vyzyeH3cUVWiNfKBnBbt1GC9FIhIrXCxhmXyTqDk6VyM6e9fIVR78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEt//7b0h+XfBwzDa0la5rN/Bqr1idRmr8Rb/IX1XU0=;
 b=Bi3I5F7UysQxvdBnCSzZHQibKJp1QnIT8CJYPw2RUZgEiQJMPOrGj7PgKSv9NMa0fcmdxLdM+SdAcMMucnof8NhR8PjXiS7oTK7YXLCdba7Ux2NnenciMZ9FM3OgMIM+mXaQQWnMOBYN9LgRNb8vIRw6+zkuTxyJxVuqqBvJ3Z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB8PR04MB6875.eurprd04.prod.outlook.com (2603:10a6:10:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 11:10:25 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 11:10:24 +0000
Message-ID: <d435d26f-63f0-d92a-bfde-d51a71001f51@theobroma-systems.com>
Date: Fri, 22 Apr 2022 13:10:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH 8/9] migration-guides: complete migration guide for
 4.0
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
 <f0106e362d6b4b4e827c1aa8533511a3684df927.1650591341.git.paul.eggleton@linux.microsoft.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <f0106e362d6b4b4e827c1aa8533511a3684df927.1650591341.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0217.eurprd07.prod.outlook.com
 (2603:10a6:802:58::20) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e216636-a602-4fdc-c75e-08da2450b295
X-MS-TrafficTypeDiagnostic: DB8PR04MB6875:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB6875A24AF972A6006F0A5524C2F79@DB8PR04MB6875.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fQFVUPyWRG52GuyIn3WbWxyfuCucDC3f1rZTuZQSnw09Q5VRox6G6H9CO2mrWQbip0Y6Xwe+8b2nqfmA18iNFPIajEDPwJ6+GNJOwg8ymw05Krk5nOrbgot3Qg/nqkE66XuqH8cWfpnEsKWs6ba9zl946JdNhpH7P96BewBQiQLMw+ztt5edhhpwDe+7BJDXtTsVKRWcnViobKWnEWBAGXS1H7rkFLtbuDupdQKl2t6edtYucXkWSvutAKAeuPWCcHcO0cVzyjSSldu+aK+BjgCoofQIQxODtuZUtzZXzahxFY0zLpZF7miZjLWJoZSfMebFEwPpdPg2KGh3uig+H6rZNPwh1lwSqSE2gr6dKW8OGyUReCbo8Mbgntac69Pu/kLxP1+B0UNAkl+50K1UB5MdbAoVTEIN8Tqsj9FDP+y9HWrK1/LxwDl1LOSbwOMqasWnSC8J1czF0lCHXIDxtJbqffq74kqm6qZE+/suK36h1LlvuRQ9JhLz+oc7/rZXPV2Az5S0m4HeV39pzfePdKf3GJ8cH6lwMUpPbBbBPCslDikOJsqVgACQd34tKxP6aQg2wlVcXTe5FHoLOTzdzC0n8dWyTArGpSWnq1xe/ieMiSOUV4BHO+YDJHZ1SALswHj5wfxhlgRgY8Ogx7Q6ho80sBIv9MWXshp/aROirJh1dA8D9W3i3eM1tb3RxZYLZNaSRAwb2cOp76tIeBRLi2wN7AkmSeEpbvTideZDKZ6ONb3OhzLE7Ytvnzr35nQZ1Fr5b2N7/f3JFOaUJIhMeSIARqDtYJdoPDmyuo+rOtfkOwHkOvNTuYHw2hDoaGrr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(44832011)(2906002)(5660300002)(38100700002)(966005)(30864003)(8936002)(2616005)(6506007)(6666004)(6512007)(53546011)(31686004)(186003)(83380400001)(36756003)(6486002)(66476007)(45080400002)(66556008)(8676002)(66946007)(498600001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnBoUjVMaFNrK3F1a1VndDZ6Y2RqMWlrbUdUNlRTTkQrQmxQaG5qWW4zbzV1?=
 =?utf-8?B?bXpDUDFtdDM4Z0hWbjhVeDZrYld1SVZnUmVEU0h3cWE2OHhpN2t2NnFHVmFw?=
 =?utf-8?B?QWgyZkc1WU5GblpkR2ppc0JpbEVqTXJZaUE4clhzM0J1dTZXcGZ3c2trSExw?=
 =?utf-8?B?VGtxL01RTG1tNWRXZlVtSVZVd2F0MG5CY1Q1MHVXTGR2amVkNWt0NEJZMURG?=
 =?utf-8?B?Zm9tTjB3clRwdnN3Z3Q5bFJXME96alhtY0NHS3Uwd3RZNm5nNEZIamE0N3Nv?=
 =?utf-8?B?b3RXTEF4dmwzM0JjMVR0QnlxSG15cnFFbTI2M1o0ZGRqY05YK2d6ZndteXli?=
 =?utf-8?B?ZUVHejdiTitUL0UrM0J2REZ4bkx2NmJwVGJ5N1paSlprMmVTd1JMdDlkQmlP?=
 =?utf-8?B?YndZQnp0RWhjZEIvS3lRTzlOSEtUaENFSW1hUkl6U09oY2oydVY1eks0Y2I3?=
 =?utf-8?B?SStiUkJ3STZnSi9Ob2pEdzVqYkpscHh6OWpEUFpnS1pZTCtCaW93NDFoWW03?=
 =?utf-8?B?clNNT1gzcUVxVFNJVEpCeVFYNFl2cUlKaTRQVHNmaW5HSEorUU5VanlQZHM3?=
 =?utf-8?B?aXY3NGhtOW5WMzFNRXpXT2lQaGZ6MjJyM0tlOGhwYnpwK29kNmVEL0dpN285?=
 =?utf-8?B?c3FZaDFQM042RUV1NzRjNk1YbndWUXB2R0c3SHhFNE9BbEdPdGxQSFM1Z2JC?=
 =?utf-8?B?WGVnZ1lFWVpjeitCajllU1RoV0VpbFl3VSsvL1M4T1AxNTdOTjN6WWlNZ1JT?=
 =?utf-8?B?TEdlKzZqeUFGNGd0bkZES2JFVExZUUNDalorVVNDcC95ZzhVeVhqRk1JQVp0?=
 =?utf-8?B?V2lkRFpKRFNSKy9vNyt2SUJ5SXgyMEtUcTc1YVVzY0lFRU4yZU16Wmd5MklD?=
 =?utf-8?B?OEIrUlRUTnFpaXJ5cWlyQ0Rqa3FzR3M2MnRkQXBtTnZqSktUbHRlaTRHajBM?=
 =?utf-8?B?K2hNcXNJanlsWlRueGVYdEpndWFnek9Td1pMblFETkhmY3oxS0E2YXBVZFRy?=
 =?utf-8?B?MysrYXErOEllSFFtem1FYm9oUXNTNC9wSmIwd3RXbFFQeWdEVU5TMU9xaFRq?=
 =?utf-8?B?MVZCTmViejRPUFFhV1BtWDJCaU5FRWg3QU5aNlM4WEdEWEdHQVlyYWJkU2ht?=
 =?utf-8?B?SUhTRmRhVFR0UFZtZGY0eEZ5Nm8yUVpxNVllMXZVR0pYcVpMY0poamJjU0da?=
 =?utf-8?B?d3MzOEd0L01jYnNob1VyTk05b2UxM3FKYlJ5ZWFoK214RkJTUnBxVG00aTJw?=
 =?utf-8?B?Zm1MSVpoYkZ6MHFWOXhoRUVnSFZlRHZqWE8xZERiVTdkRmpEOFg3YXNHKzFJ?=
 =?utf-8?B?Q1RtK1pFd094bjdaMWVQb2ViK1JTeDVycU90NkNzZ3V4TW8vWFYvUDdja0l2?=
 =?utf-8?B?TFN0NWZvZTBxT3E4LzBNUWJvcjd6YTlVMDZnR3lvTnNmK05yMmtGMEdNTHpL?=
 =?utf-8?B?VlhtZ0ZXK0txaks1WFMrSU5kNVFUSzNMK2dBMi9tNmZQUmtMdDlVS0Z1UDZR?=
 =?utf-8?B?Mk5jb24raU1XQmIzalNoNFhFTFBOb0FMY09UeWlhN0RheC9lM0k0S0ljYURS?=
 =?utf-8?B?UFp1ejZGb2dyWFVwQ2Q0MlhQMFhXQ0Q5WTROU2ViOVUzdHZMWHExYVMrWWZX?=
 =?utf-8?B?TGhnNkNXL2lMNjFzai96TWZvQUhUSEJNcVlVNFErZVRnbUZWTzB2SUx0MmZM?=
 =?utf-8?B?YkIzQmpteGtxWlMxTWxxZFBjWFFSOENXWWUybjg5WHFVdkZYRGY4MEgvWkk3?=
 =?utf-8?B?a2dvbTlGUVBxcTNPTU10ZDRtaVRteUVQejAramdjZjFzYVh1d3JmMnJQR1JF?=
 =?utf-8?B?dDh1NVlIVS9ISUhPMnhxY2J6dktOYmJQMDJuRHhMa2JEZExBL3RueWd2NWxo?=
 =?utf-8?B?dXRnTmRsU0tJeFNuWm4vZDJwbjNUallINW5BLzJRckYzdWhtVy8xQ2paSXZ6?=
 =?utf-8?B?L0QvQTJSWjhvRXRKSmlHUFlzZFd4ek5xREs0VldVNU1NdjludzRZYjZPSGVB?=
 =?utf-8?B?bGxNaXpMTm1BWWZvRW9WUG5YUW41dk5sNW5rMkNZTW1tOUNCbnRqSkN1NjUv?=
 =?utf-8?B?dGJjZHoxaVlWdHIzVnZwaUFvdEovUS81UXNiWVFmVGJRVkkrR1o0NFZrbkUw?=
 =?utf-8?B?RWFSeS9RL2lsYTZoRDNjbWQwcHRyQ3FTbzN0Nk0rdlBySXBQbnB6Z2JEeTJk?=
 =?utf-8?B?NUdRK0tGRU9Jb04vRm1DSlVJZTZHbkMzSmJUV3MzRHJBUTFiaWgzbzgrbWd4?=
 =?utf-8?B?dHhyS0dLVVhvT3pVSkFlaUVJbVNYSmkvTjZ3WlRmRDR0QnRjZ2cxQU9aa2Vz?=
 =?utf-8?B?N1pFdkFDeStUSWhRbllOcDNMVjFQSDdvZFFhbzJjZzBYWU1pNmlCY29Jb0pX?=
 =?utf-8?Q?ncevR6XDxYanbxBxPQa0P1XtJ3Wo5Q4vBylkOONcMw53J?=
X-MS-Exchange-AntiSpam-MessageData-1: fmeTUHXlsBDgA750I96iLN7qODocMHgqpuA=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e216636-a602-4fdc-c75e-08da2450b295
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 11:10:24.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nbgwQ5fodeggqmGyNhpHRiEb2meWvRgJjv5v82famHJabujr1A8WnB3856PK2OItnPGq7RsagIMl+HnL5eX7mrDe19+42UITMljl3/8ySa4iZpbP3YvtZ9IQOeL/6+KV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6875
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2838

Hi Paul,

On 4/22/22 03:40, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> * Make some corrections to preliminary set of entries
> * Move out entries that were more appropriate for the release notes
>    (i.e. that are more additions rather than changes that require the
>    user to make changes)
> * Add new entries based on commits in the kirkstone branch
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   documentation/migration-guides/migration-4.0.rst | 346 +++++++++++++++--------
>   1 file changed, 221 insertions(+), 125 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
> index 202999e..6725e25 100644
> --- a/documentation/migration-guides/migration-4.0.rst
> +++ b/documentation/migration-guides/migration-4.0.rst
> @@ -1,61 +1,74 @@
>   Release 4.0 (kirkstone)
>   =======================
>   
> +Migration notes for 4.0 (kirkstone)
> +-----------------------------------
> +
>   This section provides migration information for moving to the Yocto
>   Project 4.0 Release (codename "kirkstone") from the prior release.
>   
> -Recipe changes
> ---------------
> -
> -- To use more `inclusive language <https://urldefense.proofpoint.com/v2/url?u=https-3A__inclusivenaming.org_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=Z5qU29OH0UrZfgDAR6s26i9mKL_OmsXXyma6cmsvVZY&e= >`__
> -  in the code and documentation, some variables have been renamed or even
> -  deleted. BitBake will stop with an error when renamed or removed variables
> -  still exist in your recipes or configuration.
> -
> -  Please note that the change applies also to environmental variables, so
> -  make sure you use a fresh environment for your build.
> -
> -  The following variables have changed their names:
> -
> -  - ``BB_ENV_WHITELIST`` became :term:`BB_ENV_PASSTHROUGH`
> -  - ``BB_ENV_EXTRAWHITE`` became :term:`BB_ENV_PASSTHROUGH_ADDITIONS`
> -  - ``BB_HASHBASE_WHITELIST`` became :term:`BB_BASEHASH_IGNORE_VARS`
> -  - ``BB_HASHCONFIG_WHITELIST`` became :term:`BB_HASHCONFIG_IGNORE_VARS`
> -  - ``BB_HASHTASK_WHITELIST`` became ``BB_TASKHASH_IGNORE_TASKS``
> -  - ``BB_SETSCENE_ENFORCE_WHITELIST`` became ``BB_SETSCENE_ENFORCE_IGNORE_TASKS``
> -  - ``CVE_CHECK_PN_WHITELIST`` became :term:`CVE_CHECK_SKIP_RECIPE`
> -  - ``CVE_CHECK_WHITELIST`` became :term:`CVE_CHECK_IGNORE`
> -  - ``ICECC_USER_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
> -  - ``ICECC_SYSTEM_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
> -  - ``ICECC_USER_PACKAGE_WL`` became :term:`ICECC_RECIPE_ENABLE`
> -  - ``ICECC_USER_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
> -  - ``ICECC_SYSTEM_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
> -  - ``LICENSE_FLAGS_WHITELIST`` became :term:`LICENSE_FLAGS_ACCEPTED`
> -  - ``MULTI_PROVIDER_WHITELIST`` became :term:`BB_MULTI_PROVIDER_ALLOWED`
> -  - ``PNBLACKLIST`` became :term:`SKIP_RECIPE`
> -  - ``SDK_LOCAL_CONF_BLACKLIST`` became :term:`ESDK_LOCALCONF_REMOVE`
> -  - ``SDK_LOCAL_CONF_WHITELIST`` became :term:`ESDK_LOCALCONF_ALLOW`
> -  - ``SDK_INHERIT_BLACKLIST`` became :term:`ESDK_CLASS_INHERIT_DISABLE`
> -  - ``SSTATE_DUPWHITELIST`` became ``SSTATE_ALLOW_OVERLAP_FILES``
> -  - ``SYSROOT_DIRS_BLACKLIST`` became :term:`SYSROOT_DIRS_IGNORE`
> -  - ``UNKNOWN_CONFIGURE_WHITELIST`` became :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
> -
> -  In addition, ``BB_STAMP_WHITELIST``, ``BB_STAMP_POLICY``, ``INHERIT_BLACKLIST``
> -  and ``TUNEABI_WHITELIST`` have been removed.
> -
> -  Many internal variable names have been also renamed accordingly.
> -
> -  In addition, in the ``cve-check`` output, the CVE issue status ``Whitelisted``
> -  has been renamed to ``Ignored``.
> -
> -  A :oe_git:`convert-variable-renames.py
> -  </openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
> -  script is provided to convert your recipes and configuration,
> -  and also warns you about the use of problematic words. The script performs
> -  changes and you need to review them before committing. An example warning
> -  looks like::
> -
> -     poky/scripts/lib/devtool/upgrade.py needs further work at line 275 since it contains abort
> +.. _migration-4.0-inclusive-language:
> +
> +Inclusive language improvements
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +To use more `inclusive language <https://urldefense.proofpoint.com/v2/url?u=https-3A__inclusivenaming.org_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=Z5qU29OH0UrZfgDAR6s26i9mKL_OmsXXyma6cmsvVZY&e= >`__
> +in the code and documentation, some variables have been renamed, and
> +some have been deleted where they are no longer needed. In many cases the
> +new names are also easier to understand. BitBake will stop with an error when
> +renamed or removed variables still exist in your recipes or configuration.
> +
> +Please note that the change applies also to environmental variables, so
> +make sure you use a fresh environment for your build.
> +
> +The following variables have changed their names:
> +
> +- ``BB_ENV_WHITELIST`` became :term:`BB_ENV_PASSTHROUGH`
> +- ``BB_ENV_EXTRAWHITE`` became :term:`BB_ENV_PASSTHROUGH_ADDITIONS`
> +- ``BB_HASHBASE_WHITELIST`` became :term:`BB_BASEHASH_IGNORE_VARS`
> +- ``BB_HASHCONFIG_WHITELIST`` became :term:`BB_HASHCONFIG_IGNORE_VARS`
> +- ``BB_HASHTASK_WHITELIST`` became ``BB_TASKHASH_IGNORE_TASKS``
> +- ``BB_SETSCENE_ENFORCE_WHITELIST`` became ``BB_SETSCENE_ENFORCE_IGNORE_TASKS``
> +- ``CVE_CHECK_PN_WHITELIST`` became :term:`CVE_CHECK_SKIP_RECIPE`
> +- ``CVE_CHECK_WHITELIST`` became :term:`CVE_CHECK_IGNORE`
> +- ``ICECC_USER_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
> +- ``ICECC_SYSTEM_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
> +- ``ICECC_USER_PACKAGE_WL`` became :term:`ICECC_RECIPE_ENABLE`
> +- ``ICECC_USER_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
> +- ``ICECC_SYSTEM_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
> +- ``LICENSE_FLAGS_WHITELIST`` became :term:`LICENSE_FLAGS_ACCEPTED`
> +- ``MULTI_PROVIDER_WHITELIST`` became :term:`BB_MULTI_PROVIDER_ALLOWED`
> +- ``PNBLACKLIST`` became :term:`SKIP_RECIPE`
> +- ``SDK_LOCAL_CONF_BLACKLIST`` became :term:`ESDK_LOCALCONF_REMOVE`
> +- ``SDK_LOCAL_CONF_WHITELIST`` became :term:`ESDK_LOCALCONF_ALLOW`
> +- ``SDK_INHERIT_BLACKLIST`` became :term:`ESDK_CLASS_INHERIT_DISABLE`
> +- ``SSTATE_DUPWHITELIST`` became ``SSTATE_ALLOW_OVERLAP_FILES``
> +- ``SYSROOT_DIRS_BLACKLIST`` became :term:`SYSROOT_DIRS_IGNORE`
> +- ``UNKNOWN_CONFIGURE_WHITELIST`` became :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
> +- ``WHITELIST_<license>`` became ``INCOMPATIBLE_LICENSE_EXCEPTIONS``
> +
> +In addition, ``BB_STAMP_WHITELIST``, ``BB_STAMP_POLICY``, ``INHERIT_BLACKLIST``,
> +``TUNEABI``, ``TUNEABI_WHITELIST``, and ``TUNEABI_OVERRIDE`` have been removed.
> +
> +Many internal variable names have been also renamed accordingly.
> +
> +In addition, in the ``cve-check`` output, the CVE issue status ``Whitelisted``
> +has been renamed to ``Ignored``.
> +
> +The :term:`BB_DISKMON_DIRS` variable value now uses the term ``HALT``
> +instead of ``ABORT``.
> +
> +A :oe_git:`convert-variable-renames.py
> +</openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
> +script is provided to convert your recipes and configuration,
> +and also warns you about the use of problematic words. The script performs
> +changes and you need to review them before committing. An example warning
> +looks like::
> +
> +    poky/scripts/lib/devtool/upgrade.py needs further work at line 275 since it contains abort
> +
> +Fetching changes
> +~~~~~~~~~~~~~~~~
>   
>   - Because of the uncertainty in future default branch names in git repositories,
>     it is now required to add a branch name to all URLs described
> @@ -70,7 +83,8 @@ Recipe changes
>   - Because of `GitHub dropping support for the git:
>     protocol <https://urldefense.proofpoint.com/v2/url?u=https-3A__github.blog_2021-2D09-2D01-2Dimproving-2Dgit-2Dprotocol-2Dsecurity-2Dgithub_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=qIusTKRAujq_yLu7-NcnfXgxBc9anmWi8wGLcPoVjc0&e= >`__,
>     recipes now need to use ``;protocol=https`` at the end of GitHub
> -  URLs. The same script as above can be used to convert the recipes.
> +  URLs. The same ``convert-srcuri`` script mentioned above can be used to convert
> +  your recipes.
>   
>   - Network access from tasks is now disabled by default on kernels which support
>     this feature (on most recent distros such as CentOS 8 and Debian 11 onwards).
> @@ -84,87 +98,169 @@ Recipe changes
>     usually undermines fetcher source mirroring, image and licence manifests, software
>     auditing and supply chain security.
>   
> -- The :term:`TOPDIR` variable and the current working directory are no longer modified
> -  when parsing recipes. Any code depending on that behaviour will no longer work.
> -
> -- The ``append``, ``prepend`` and ``remove`` operators can now only be combined with
> -  ``=`` and ``:=`` operators. To the exception of the ``append`` plus ``+=`` and
> -  ``prepend`` plus ``=+`` combinations, all combinations could be factored up to the
> -  ``append``, ``prepend`` or ``remove`` in the combination. This brought a lot of
> -  confusion on how the override style syntax operators work and should be used.
> -  Therefore, those combinations can simply be replaced by a single ``append``,
> -  ``prepend`` or ``remove`` operator without any additional change.
> -  For the ``append`` plus ``+=`` (and ``prepend`` plus ``=+``) combinations,
> -  the content should be prefixed (respectively suffixed) by a space to maintain
> -  the same behavior.  You can learn more about override style syntax operators
> -  (``append``, ``prepend`` and ``remove``) in the BitBake documentation:
> -  :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:appending and prepending (override style syntax)`
> -  and :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`.
> +License changes
> +~~~~~~~~~~~~~~~
>   
> -- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
> -  which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
> +- The ambiguous "BSD" license has been removed from the ``common-licenses`` directory.
> +  Each recipe that fetches or builds BSD-licensed code should specify the proper
> +  version of the BSD license in its :term:`LICENSE` value.
>   
> -- :term:`LICENSE` definitions now have to use `SPDX identifiers <https://urldefense.proofpoint.com/v2/url?u=https-3A__spdx.org_licenses_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=u7wGKvbMLeyxL8__NUVf16Enm2tT7IYNDKgMTir9190&e= >`__.
> -  A :oe_git:`convert-spdx-licenses.py </openembedded-core/tree/scripts/contrib/convert-spdx-licenses.py>`
> +- :term:`LICENSE` variable values should now use `SPDX identifiers <https://urldefense.proofpoint.com/v2/url?u=https-3A__spdx.org_licenses_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=u7wGKvbMLeyxL8__NUVf16Enm2tT7IYNDKgMTir9190&e= >`__.
> +  If they do not, by default a warning will be shown. A
> +  :oe_git:`convert-spdx-licenses.py </openembedded-core/tree/scripts/contrib/convert-spdx-licenses.py>`
>     script can be used to update your recipes.
> -
> -- :term:`SRC_URI`: a new :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:crate fetcher (\`\`crate://\`\`)`
> -  is available for Rust packages.
> -
> -Class changes
> --------------
> -
> -- The ``distutils*.bbclasses`` have been moved to ``meta-python``. The classes and
> -  `DISTUTILS*` variables have been removed from the documentation.
> -
> -- ``blacklist.bbclass`` is removed and the functionality moved to the
> -  :ref:`base <ref-classes-base>` class with a more descriptive
> -  ``varflag`` named :term:`SKIP_RECIPE` which will use the `SkipRecipe()`
> -  function. The usage will remain the same::
> -
> -     SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
> -
> -- The Python package build process based on `wheels <https://urldefense.proofpoint.com/v2/url?u=https-3A__pythonwheels.com_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=DqUeSgcMrforL2eigBvT5K4wc67801m8zXn0tF48n2k&e= >`__.
> +
> +- :term:`INCOMPATIBLE_LICENSE` should now use `SPDX identifiers <https://urldefense.proofpoint.com/v2/url?u=https-3A__spdx.org_licenses_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=u7wGKvbMLeyxL8__NUVf16Enm2tT7IYNDKgMTir9190&e= >`__.
> +  Additionally, wildcarding is now limited to specifically supported values -
> +  see the :term:`INCOMPATIBLE_LICENSE` documentation for further information.
> +
> +- The ``AVAILABLE_LICENSES`` variable has been removed. This variable was a performance
> +  liability and is highly dependent on which layers are added to the configuration,
> +  which can cause signature issues for users. In addition the ``available_licenses()``
> +  function has been removed from the :ref:`license <ref-classes-license>` class as
> +  it is no longer needed.
> +
> +Removed recipes
> +~~~~~~~~~~~~~~~
> +
> +The following recipes have been removed in this release:
> +
> +- ``dbus-test``: merged into main dbus recipe
> +- ``libid3tag``: moved to meta-oe - no longer needed by anything in OE-Core
> +- ``libportal``: moved to meta-gnome - no longer needed by anything in OE-Core
> +- ``linux-yocto``: removed version 5.14 recipes (5.15 and 5.10 still provided)
> +- ``python3-nose``: has not changed since 2016 upstream, and no longer needed by anything in OE-Core
> +- ``rustfmt``: not especially useful as a standalone recipe
> +
> +Python changes
> +~~~~~~~~~~~~~~
> +
> +- ``distutils`` has been deprecated upstream in Python 3.10 and thus the ``distutils*``
> +  classes have been moved to ``meta-python``. Recipes that inherit the ``distutils*``
> +  classes should be updated to inherit ``setuptools*`` equivalents instead.
> +
> +- The Python package build process is now based on `wheels <https://urldefense.proofpoint.com/v2/url?u=https-3A__pythonwheels.com_&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=DqUeSgcMrforL2eigBvT5K4wc67801m8zXn0tF48n2k&e= >`__.
>     Here are the new Python packaging classes that should be used:
> -  :ref:`python-flit_core <ref-classes-python_flit_core>`,
> -  :ref:`setuptools_python-build_meta <ref-classes-python_setuptools_build_meta>`
> -  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.
> -
> -- ``image-prelink.bbclass`` class is removed.
> -
> -- New :ref:`overlayfs <ref-classes-overlayfs>` and
> -  :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` classes are available
> -  to make it easier to overlay read-only filesystems (for example)
> -  with `OverlayFS <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_OverlayFS&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=zUgPJ_h8gSNDb6D_jJmzEp0xgHZmjbm0nVeKaaIByHc&e= >`__.
> -
> -Configuration changes
> ----------------------
> -
> -- The Yocto Project now allows to reuse Shared State from its autobuilder.
> -  If the network connection between our server and your machine is faster
> -  than you would build recipes, you can try to speed up your builds
> -  by using such Share State and Hash Equivalence by setting::
> -
> -     BB_SIGNATURE_HANDLER = "OEEquivHash"
> -     BB_HASHSERVE = "auto"
> -     BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
> -     SSTATE_MIRRORS ?= "file://.* https://urldefense.proofpoint.com/v2/url?u=https-3A__sstate.yoctoproject.org_-26YOCTO-5FDOC-5FVERSION-3B_PATH-3Bdownloadfilename-3DPATH&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=XB22zEBGRLceQo6C7NPJlhjcCCLaVQyi-H64nhlgdBI&e= "
> +  :ref:`python_flit_core <ref-classes-python_flit_core>`,
> +  :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>`
> +  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.
> +
> +- The :ref:`setuptools3 <ref-classes-setuptools3>` class ``do_install()`` task now
> +  installs the ``wheel`` binary archive. In current versions of ``setuptools`` the
> +  legacy ``setup.py install`` method is deprecated. If the ``setup.py`` cannot be used
> +  with wheels, for example it creates files outside of the Python module or standard
> +  entry points, then :ref:`setuptools3_legacy <ref-classes-setuptools3_legacy>` should
> +  be used instead.
> +
> +Prelink removed
> +~~~~~~~~~~~~~~~
> +
> +Prelink has been dropped by ``glibc`` upstream in 2.36. It already caused issues with
> +binary corruption, has a number of open bugs and is of questionable benefit
> +without disabling load address randomization and PIE executables.
> +
> +We disabled prelinking by default in the honister (3.4) release, but left it able
> +to be enabled if desired. However, without glibc support it cannot be maintained
> +any further, so all of the prelinking functionality has been removed in this release.
> +If you were enabling the ``image-prelink`` class in :term:`INHERIT`, :term:`IMAGE_CLASSES`,
> +:term:`USER_CLASSES` etc in your configuration, then you will need to remove the
> +reference(s).
> +
> +Reproducible as standard
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Reproducibility is now considered as standard functionality, thus the
> +``reproducible`` class has been removed and its previous contents merged into the
> +:ref:`base <ref-classes-base>` class. If you have references in your configuration to
> +``reproducible`` in :term:`INHERIT`, :term:`USER_CLASSES` etc. then they should be
> +removed.
> +
> +Additionally, the ``BUILD_REPRODUCIBLE_BINARIES`` variable is no longer used.
> +Specifically for the kernel, if you wish to enable build timestamping functionality
> +that is normally disabled for reproducibility reasons, you can do so by setting
> +a new :term:`KERNEL_DEBUG_TIMESTAMPS` variable to "1".
>   
>   Supported host distribution changes
> ------------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> -- New support for `AlmaLinux <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_AlmaLinux&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=ReF4T_58BfBXfy5YupDxz7c_eP3JtIDNVezKsq5_POw&e= >`__
> +- Support for `AlmaLinux <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_AlmaLinux&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=ReF4T_58BfBXfy5YupDxz7c_eP3JtIDNVezKsq5_POw&e= >`__
>     hosts replacing `CentOS <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_CentOS&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=x4oFoUHA6AOMkVCu41gRBKfld1KtSwYuX7AwxPXIkD4&e= >`__.
>     The following distribution versions were dropped: CentOS 8, Ubuntu 16.04 and Fedora 30, 31 and 32.
>   
> -Changes for release notes
> --------------------------
> -
> -- Share State cache: now using `ZStandard (zstd) <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_Zstd&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=V_Vs2jVTKsmqXE6NV545ZU65Zx8CQJeXVIaQKEnPj2w&e= >`__
> -  instead of Gzip compression, for better performance.
> -
> -- BitBake has an improved ``setscene`` task display.
> +- ``gcc`` version 7.5 is now required at minimum on the build host. For older
> +  host distributions where this is not available, you can use the
> +  ``buildtools-extended-tarball`` (easily installable using
> +  ``scripts/install-buildtools``).
> +
> +_append/_prepend in combination with other operators

s/_/:/

Cheers,
Quentin

