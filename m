Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D247ECDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:26:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38743.1782116768981359098
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TPqDShR7;
 spf=pass (domain: cherry.de, ip: 52.101.66.5, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haVqya14UZM1cdE0EEEJCKgjXy4OTmJQRO3Otch2q8J699n266cMU9qz2wAWM3RoUQKzqq+D0gQj53xswPml3Nm/va55dREUnIDlX4cyZ2M1w0PW6wb+u18/n/Ux5bjcZSe1CGegGJBX56HCnLQmkBn0Xlt6jtTy5R2w0BDAU7fb0foqFDVJX83j6+BCgt2EMaIKpU1w7qntEqXkG8ZZ8jkAHaD9vCOePGg8XmnRH1Nik0bQhDM7+LHaNeMNVboQO61K9v4orvQpbsSl13w5JZ6tIykbPFVC3THblub8/y/l/EDfP85UW/en3Jn41GzXI1n2gJHrqI2NCumfyfa0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvzm3yx9whdJPKSGLy6RrnLt0HjhQvuLEoxe7xxy/CE=;
 b=Ht63HppaDuSR7HneNQYUSFfqB1n49bGWoCoTaHQpoz+vCXe8GvZ5pRCqYPuIniVDI/PJIM5YyH1saFPigOQp2h1qNWbVzmcOqJACw31QMK3HINsXWDtKahMDqDnEd7EV4+prNHfnTOlcU2U2TSMSghTpNGIx+7tLiOOpdM84xyko7aqlpEcsg4Wt8dwBr7rKSmjj6RdsEQDHq2i4ael9wRqIslwlfbU9QFq0bmq39nH55KoBQ6+Wjbxm0olGgIDrQGiHso4YOFSHCC+TZpveznAgPOr+bq14wUWvlUd66KSpsEUTo46yoT4tLf+VR1/yqHQqCxO0Wd7WrQKaHFqylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvzm3yx9whdJPKSGLy6RrnLt0HjhQvuLEoxe7xxy/CE=;
 b=TPqDShR7RGN7oSeo2mYRxkQJP+afd1w8bW9yVqxbpS0Gwn3X8UXGUx2JBXIdN9v2q23a6i5t7fFMlxI172RTj/qI8bS7VGn3pmbB4yzG/faAsjJ8eceyUUgWF4XeFPYp44JmKLl6oXMtPnUOXhrTQmNFRoCU64z3lRlLPC1/d9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 08:26:04 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:26:04 +0000
Message-ID: <9d9677d5-6d9a-4f71-9d09-57342714e47f@cherry.de>
Date: Mon, 22 Jun 2026 10:26:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] host_packages_scripts/ubuntu_docs.sh: remove
 python3-saneyaml
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20260622-remove-saneyaml-dependency-v1-1-5ff9f1f37db0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260622-remove-saneyaml-dependency-v1-1-5ff9f1f37db0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0153.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34c::18) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS5PR04MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e536ef6-f094-44e9-e45d-08ded037e669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	viBs6MtBPlpeIEd5W/nGVME5Rh2O0cjy12owYu+AEHky4G4bZ6qnkTwicTX6+oVRA3ICFWw9rx+RJ6MJ32SYYkfuGuAM93jl3MJ936jR9NnmlGx10mnRWc83pDqCtIap8ZCkFywi19LQ2um48g3I1tCHoIdHWhUWCh/NJHzB0GZz+twL9bYOr4oD4iEIcCEkdBDSQaoaZOx1uN5xhKDs3x9XPhcDYA5bOCieex0n5RjM21KaJBZEwldhUKccTcI3UoorNJn6p/iL2vQ1UjTCYjYTO+Mjuw13vwmw4J3ej3VZAlqgYMF/EZX3JWyN0BkVG+WropEUMZf5rbkpW3AVtrcc8CJk16ewJmSSof4H3bnGX8hei4i7YE9PXS+v5N5v0lVsLmb3j2EWo6rosKBmFK+CZlXp4Zw91Ye3TKLR6chkK7S1vM7htnVnIrWrVVyOeoWUpv5SsbURKXLWW8hBFSC3bTp5C65bIsuW3OS5c0NklFp+DqGZKHdZcdvoccfb/ZZI4cwFTxdGdX/T25jGzZ+ryp5FHHh6CrxcuHb+t9k3HGOAYyUwzzymmjAsTqwZYdHUlECZ8OE+AnBTGqEyNzME5D1nnFv4sPax++EfvGE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFNCbk1GbkJiaW16VjJWZmVVRmlrdDV0K3RvaWVEUldsbmtmeENRWXRRcXlM?=
 =?utf-8?B?SE1WN2FsYkVTK21zUWNwTjF2RWZnQ3VqdnZNMUN2UXF1M1VDYWErWTlnRTRR?=
 =?utf-8?B?bGwraUZLM0NUYmUwUHlTcUdJOFJkbmZSNVRyVlMrcXJLNHQzMXpXMmg5N01H?=
 =?utf-8?B?cjM2S2ZhRlRnRFZEODBudnZRVTc3QmZoNHFub2tEOTlCeFdCTzNneFdnOEE2?=
 =?utf-8?B?MmdxL0tmWkZ1K1Foay8zNHcwb1J5elk4TUZzUXB2dlJjeXFVWi9lTUNldFN6?=
 =?utf-8?B?VmpCVWdESjNobFA5UFl1dDlUeUVXeWFJeDU3UUNXVlVTeVAvN3VwazBrbEpV?=
 =?utf-8?B?UTc0b1JrUHhpaFdZODBQckxQc3ZCODJkMGlPM0o1SGdIQXhBMFdtUFVSZ0hr?=
 =?utf-8?B?S2tCYU1yU3JMV01lbm5TL3hZb0toeEtXQVVjZjJqMTlCL2o5T3ZDUUJOalJB?=
 =?utf-8?B?S3FqL0ZvMEpoQUJTSVI1NkdJOTRnY2FwY0wrREhDV285dnFzWmI4QmE5blhn?=
 =?utf-8?B?bzhqZURxd0dPWkw4djl6WW1GQ0RnRklyY1pqUktPNXpldlQzMmR5dnZhWFhB?=
 =?utf-8?B?VzNLKzZoN29KS21pVytMamVvVmZ1Zkdad0NDTVlzMkZzTDZUWGJZdzdhZW4z?=
 =?utf-8?B?WVVRaHFZMXZkWkliNEsyZG1EVW5sU1M4TmJuUjRoQXd2S3RDa3dFZ2tkUlln?=
 =?utf-8?B?eGg2ck4xdlhNRGlDdmkzZm9ocjFIcDhyQ25wNm1RS2lBWGRjQnBSaFN3ckJQ?=
 =?utf-8?B?ZzN5cjJBYmdWd1lZWjBBeGtSR3JLeXNjdGsyTWlJek5wNE1vcUJLNXF2aWo2?=
 =?utf-8?B?MWJ1ZnU2M0JZN0thTzVUaXhrejVxUHhTQUpBOE5mTDdJSEdNYit0NldpRWQx?=
 =?utf-8?B?c3A5akdKR1hqYm9MMmFtRDZVQ2pka3ovREFmSzJYU1M3eDRUWFB3ME5mcDdw?=
 =?utf-8?B?eUhLUURLbFFSN3ZBa25TYVNLYU1wbUVudkkrRTVIaGUvSnp5VnpHZnNRZmRs?=
 =?utf-8?B?TE5GdExscFd0Sk5MV3FWNzdvNmIyemF4WERNcUZJVGJsdGZtOWViRzBtY1hC?=
 =?utf-8?B?UlJ1NktVSUVTeUNVTDNaRVJPWmdiRU1XbEUxdWtNcTd5UmFvZnF3dWE3SSsw?=
 =?utf-8?B?T0E4ME5pUEozdDZFS2RyNmZIRzRJNkVPRXhGK1p2TVVyMGIwclBlUlZuTWVs?=
 =?utf-8?B?bjg4dFpaMko5RGhXbmkxdHFacDhSaHlFWEQvU1QrQ1hhcDRhSzlqSzF4MTlx?=
 =?utf-8?B?V3NmcEZNbW4wMFYyNm1MUXI5ZE9Wa2ZoVWswRytkRTVobis4RzFNeEY0TjdJ?=
 =?utf-8?B?dUhhaHFkRVdYcU4vMHk0YVdLcUoyTkRuK25oMHJpK2ZkVjhhTCtnSVBkOEFK?=
 =?utf-8?B?dzhxK2VWUFU2clR2eU5ROUt2WmlWTFl2ZWpJT2YrVlhSbXg0QzhBYk5pNXVL?=
 =?utf-8?B?ODMrZVR6cWkxYzVEcEhwbXc3M050cFZoNDYxaHVtVGZxSHpOemx2bW1xU0ds?=
 =?utf-8?B?RCtmbnFzOURxZ1NjamFodXQ5K0I3SjVWN0U3bDdYUTVnb0hkMnVTeG9EYmxQ?=
 =?utf-8?B?MVZzc2VBYWJqM3d1clZyeWd5SW9xWXNvdnR4V3N0YWZUcWdlMzg1U0ZUWG1E?=
 =?utf-8?B?ZGxKd1lScGczVWNIa0tya0dXMkk5MkJ1UG45cGxNaWU3ZldGWnU4MXRjTG83?=
 =?utf-8?B?K2wxUjB5a2svbTVKcWVoRDExQXc2VVZiRnN6R2lJOEcwRThxQXo3N0FuTXNk?=
 =?utf-8?B?Y1ZxT0UzaTU2Q01EOGVzZkRFdHA5WXo1Z1M0cFA0WmFDS3h3S3Jra2ZjY1Rm?=
 =?utf-8?B?U3ZkWUFpRlQ0VGhLQlB2UXBYdHlDYklIaDk3NUY4WkNQQzRkRDRVOUlVMFZU?=
 =?utf-8?B?UVRhMzAzR3o4bTZRQlZIV2ZNOTU5cWh4dHowVWFJTFFrUHdhdWIrV0g2MWlX?=
 =?utf-8?B?YnVuaHZITDN3THBOdWJPMlEreHdSOGl2cEoyRGdTNnBFdVF0TjBTdHFpQkZz?=
 =?utf-8?B?blRKLzA5eUxScGsvcG5HeXpmWWFLcUc2WDBkS3dFOXRUdWtUTERkbm90bndT?=
 =?utf-8?B?N1FxbUhibUhZb09ZZ1RIbVYrdWpGdkhMSDJTbk1UcE9iVWVlY1V3OStodU5z?=
 =?utf-8?B?YXlxaWQxcHNnTEhEQ0FQTThDUjUxN2I3b0NCQ0d3N1FQS1lhWldYdG91c2ta?=
 =?utf-8?B?UzlFaWNJaGM5OEZzbG40T3NlTTNXcWlzY1F0dGNYNDA3Z1N6NzNnck93bUZh?=
 =?utf-8?B?WmgrL1FSOFhYaHRhQkQzYy80ZWExS21YZ05hQ0ZhUzBFMHBvTkc5cFFRMFZO?=
 =?utf-8?B?dlF0cTN0SVd0THFsem4wdEJlSERuck15U0JTZmhsV3NpcXFaUnNVdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e536ef6-f094-44e9-e45d-08ded037e669
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:26:04.2897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOkLhqJ4g6hNEOCZe+MvhX4kTPG7Hzx7q3kgpS21P32TjO/6KPl6pSjiyqikpzMvjtAIAmntT14jXzcohGt2Xr3nLdIfInXHVjoMPs6Ksns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:26:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9821

Hi Antonin,

On 6/22/26 10:16 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This Python module is not used anywhere in our codebase, remove it.
> 
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/build-docs-container                 | 1 -
>   documentation/tools/host_packages_scripts/ubuntu_docs.sh | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 37d3d2bb6..459daa6de 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -108,7 +108,6 @@ main ()
>         pip3=pip3_docs.sh
>         repo=quay.io/centos
>         ;;
> -    # Missing python3-saneyaml
>       # "debian:11"*|\

Does this mean we can build on Debian Bullseye again?

Cheers,
Quentin

