Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F41EC48BCD
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web12.7079.1650624697392798867
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 03:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=HD/WSSmq;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.50,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S14HTe2RU7pA7F1kGlKTi0Y7UUk0Hjy3pwjlM3ujy+2ZpSsJZLcKGZPzEOF8OreXMzqEGlWDH/tXnmwNwabHAajgrgZSAjX/cSftTVJHAa8fy0E0YVbN0LsNh/6mRVibkNurqfheFfbO5e7LfV5RX2RdcZCN5YluiprzBbbYTYnai099MMh3JNYHtVirZ2vPjW4Z5HBJpC2k3n7vE5il4f7Luory7Hur44zJjkrRD1r69ue89V2ME4TD1MRROKtALKaBKeXXyjihegVUVtF3+2BriIc88LysEm9qy9m0qtxARRZ43q7LgcF3/tcY8s4mFU9sLck9a3tY0RbNpgsorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7AZ56YuX+GJG8J26/Qj0SMkSlhBx33rPZmvbPWTDYA=;
 b=iDD5Y4uer7+7dKdFRcrReaJ8DUk7i+6EJDXojP9fq3hsAV7Z/gcl8MnUGQDJznlzgNN/YxT7z8+MISW5XfTxpuXKvcXQdHXtZwP1Kxv3p68AHJ3UBtMaUrdl68xCUxvIQO8EwccMP/TC7vDbjQvfQXwomGKEW6K3x8HoEM66phBeb4SqX6LHM39pF29eL5lIvtrW0WXS/FW4Tx2Oe4zRdr4ur6S70u2VEvDb7VO8xVBDkACWgXhzMrPfbbqP7ZoE2BHyBSIPi2kAI50/OnAGVqZxPzdNq/X5jJWm1xlw08xzQfkjxdEaQORJOU0G3VZtFI2nif496cgd704xrHnRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7AZ56YuX+GJG8J26/Qj0SMkSlhBx33rPZmvbPWTDYA=;
 b=HD/WSSmqcZ1T08kR1efNWpuo4N37SJjvHSNXYUQgcoZ/IJ/gbYJu2Eb2ar0C+eUyiqETIeseXfrv9W+B6izeFAnIyrJtW0DgidYCU3ytWCT7wYvXJGqHa8iYtC5MOwsY1Md8ZtSJ9bv26aH5akUv5PrnziEbbYLN3nWW/IrLChQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB5150.eurprd04.prod.outlook.com (2603:10a6:803:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 10:51:32 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 10:51:32 +0000
Message-ID: <7b041364-0396-cff7-5936-956115b01a83@theobroma-systems.com>
Date: Fri, 22 Apr 2022 12:51:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH 7/9] ref-manual: add empty-dirs QA check and
 QA_EMPTY_DIRS*
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
 <0fb99813b129f7239e08240d22397a50c53ed883.1650591341.git.paul.eggleton@linux.microsoft.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <0fb99813b129f7239e08240d22397a50c53ed883.1650591341.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::39) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36978867-adef-4bf6-5528-08da244e104a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5150:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB5150CB7FFB47B48B6480EB54C2F79@VI1PR04MB5150.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rLjqUiZnekm1w9YJP8EW3+0RlxC73kxvrPLhxqju9YW3xAvPA3NLRbqSTpEA6+uwP+weSN+47I6EfdEnHQ2iX+nSmKj37Qno9mlE0h+wAi4MFjrsEavl/NyHTJX1dH2oJ1FLRzFUx65yC6KDZUH6BhqCW+vcsWsi2PNWzPFb/+DmPxpvo3eU5vjgS7QMWXleSI0Ec5HAzgaW0bDolOf6vn+V8Qf7kH+bnPBj619z4hhqHzC86gDv8racJwO4eTbAfRC1Bz8BJK3ZxfUGQJvE/nUzt/tqV4/9jERG1VCdvkuMraz27rqZBU808BNBMbOrb+CgtK1873dOtL3c2+4VadYb9RXebB+qi4SuNAU2ZdYA5wcGsV4MuVtOSRTzZHeWNDWRplXWoO2F/7F9DX0SRlfGcr3K4JiSlBPYoJlU6ByA8AbtSnze+OP6ZFKYLVVIaPEbRM+VICGYFNqi4RJ696PkiXcEIxYrJ0GTl/CU24T3H0yJwfinxPCdW8hefZM2SIqaXDgqdOivnOveg4ufNm7wtnMkaS3KoYzpTiCLDtGzCHi5Aqm3pdiNLGpXSWFk8SNmzU/CNfUtRF82wTv70IzbOarx6oX7qwIkhkjeT23ndfAS7ajV0+DYCm4H+M1MZ/EEXnhKBNPanTvWwS57Qwtn92qYN/qsp1L4nNZzQmcp0bqNQqQcCv6GnnSAlbVc8I//YBnQxZxdCuGJPqjwajya8LHFnOleWGCKz2tHPU0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(5660300002)(6506007)(31696002)(8676002)(6512007)(83380400001)(38100700002)(36756003)(45080400002)(86362001)(66946007)(53546011)(66476007)(66556008)(6486002)(316002)(2906002)(31686004)(44832011)(8936002)(186003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czBtZjh6dWtLN2VkODZoYUNBdDhNeDhTR0JpMzJjU3B2dzlWNDBRb2ZUYi9z?=
 =?utf-8?B?MVZoQzFxbFJvYUhEZWFUVHZWajVIYmZ2cGlWWWpBUVZkbXEvdW53RG00VjFE?=
 =?utf-8?B?d2RMdVgrZUdqS05KUUNEMFhZQXloWEpnQ2wyUFJrZVZ6Zk9tTE9wMFhZcnVp?=
 =?utf-8?B?RDk5SHdLTk5uMGd3UlM5UUJBK1hHWGhCenJWR21nQkRsakRxbVpDd2VZLzQy?=
 =?utf-8?B?bkNvSHU3NTlyQUcveENOT1FDQk04MDVwbHFmcnpCZVBFd2FWUTJqbnpqeTE4?=
 =?utf-8?B?cDVqUEdsRVFpazU1dGNhbHdKMHowRnI0YnZ0V1Z1UEozQTdtZjByckpTN0lz?=
 =?utf-8?B?Z2xla2ZMSHU1UC9rN2VIbE1YOFY5VEZMeGtWOGlUcERpd09Ec2FGaDFrVzE4?=
 =?utf-8?B?SFJjNkgrNFI5eGdXcWNhYm5xbXpSYWVVMmJuVjg5b3RGZEVCbHFNd3VlY0gy?=
 =?utf-8?B?ODNwcXlzeDRkenZNcTl3ZFhJbHp2bTUxbDlpM0pxV0ZQd2hEQjl4YW50T0Ro?=
 =?utf-8?B?M3dnamRmY3EyekY0bWozUk43ZWMyK0Vwa1g2S0UzMmI0eHIzeGdlaThWYTZZ?=
 =?utf-8?B?Nk91N3lLc1hURFNGbjhBN2wzZFlNbCtBUS9RcWttMEtHbDJoc1JxN1lrS1p1?=
 =?utf-8?B?SWE0c0lzRWNQTnREUFRaOTZKK2R5ZDN4Z1lvaWcrY0dtQ1Zqa2RkV0ErYVRH?=
 =?utf-8?B?UW1EejFwakNiSVdibXFuM1ZEdlZ1NU5CU3dlc3cySVBqZ3k1V1RkbjlseC9s?=
 =?utf-8?B?UEVMcGlWQU1HeVJ4TW12djZZWDQxSHNwdkRyK0NpbVJKVzVpS0h2MFJrSHJH?=
 =?utf-8?B?RE10WlFERlY0cEloR0NxM1RJMmNyU3J6U3JWdkgzUGtna1kvdXFHSnZ2WURu?=
 =?utf-8?B?TUxqVnNDUWRtZFp1Qk9lalpEY052eUpsaFdpUnJ6UkVidnovOVB0dGJVRUZM?=
 =?utf-8?B?T3pLeWJPZHIrQXhNb21SOTdldzNhQUw2emY0ZmJ5cldrMWJBb1pMMmdGY3h3?=
 =?utf-8?B?QjlwSDlmMUJlKzRVTG41dHJFcVBRa1FYU3pmd1RMVjFMVnV0RFlNRlVUZ3Fs?=
 =?utf-8?B?cXJtQ2xZQ3J1WnJNaklqWXN3QXkzY3hzWDB3RTBQNnQwcFpZMnNDN2Jid1NC?=
 =?utf-8?B?QU5WWmw4MWQ4TXRsbEgxMHZGbkZCOVd2ZXpidHlscDR0cHpyK2hna2Z3TU1p?=
 =?utf-8?B?RjFwUy9MZUppRHRCUktERmtkR3ozQ2lMZk1ZMEtEUDR2VWUzSHgvNGFFMWNI?=
 =?utf-8?B?QW5STk8yOVg5ZXdjOVIrYmQ0MEl3ZGFKWDJQSzc2aDA0bzhTRy9PQ3cvbkFC?=
 =?utf-8?B?aG1PcVhUZ3RQaUZOcnNsbloraUpGUUNLcjExOGVUTURycGlsNms1ZlFSMHFr?=
 =?utf-8?B?aXU1UGQrRzhnUzFleWY1ZHA3Y2F4RThTOGcrazhFREpMNXR5TStWN3VscWg5?=
 =?utf-8?B?V3Rrdk1uWlJTQXB5OCt5RUdaUmpjWXRDcDY3OEdHaHA1eExQb0xBVGxiejdw?=
 =?utf-8?B?SFRueVExT0VoRXFpSGpDWHFRV0RoR2xRdXRtTEh1bjZCNEdUZlpGMURhWGhn?=
 =?utf-8?B?aENoTDJxY1FUTi9OamRtLzJkNkcrMU5XWGllektyWlpNc21EOWNjUS9qbVlp?=
 =?utf-8?B?R2xvdW1BNEYyYTlTQlhmVFBpMENFMXk1d0VudVdGN29GUWVLL0Y3Nzd3YnBF?=
 =?utf-8?B?cmNzclZ2N3pJRS9pN1ZyMEtoMnRUVURaaDVTOW5ESk8wNG44bHYyWWpNejJN?=
 =?utf-8?B?a2RnT2cxYWdScWxkOHBsTExHUjFPYkoxRW5qYmVtbkpZckhRMXVQRVRlUTFi?=
 =?utf-8?B?WVM4bkR0TnkvM3QrdjI3dStBU01JL1ZrSGtpVWkzUzVNcmdzK1E5S1RBUGhy?=
 =?utf-8?B?ZjhlRUpVUktVbXNMd1BudE1tY3Q0bjJPd01Kc0lLb3pZWmFQaXBSSU14aWxQ?=
 =?utf-8?B?cU4rOUtORmpXQXBCTlBadHlJOXdZekxsOWxsck9sK1dZV3RPWkZLcitDVWZI?=
 =?utf-8?B?aXUvdm12QnpwdVNVcW5LZUN6M1pqUUZnSDJjb3JuN3IreUxXdXpBWnRPM3Ux?=
 =?utf-8?B?MVZsb1pvYnRjemhxVGVCelpjdTJIL2h0TFBzbGcrVTFEWmZLY1BiWlpzaFds?=
 =?utf-8?B?OUwyVy9IOXhmZHowT0FzOHhYVCsyeWRFVFk0T3p2STlXSEFBOTl1RHVSSUR2?=
 =?utf-8?B?N3RNZkF1NHRsSjAzM1dCcCt2UGVQRFVveWhUenZPUW1ZdzhSTGVLUjd2VlVs?=
 =?utf-8?B?dUp1ZDhrdnhKa3pEM3lSakgrN1AvR0VFT2V4ZUN1c3JEczgvbzJ6d2Npb1I0?=
 =?utf-8?B?TENTaGpmTUhFa0NUQTlRQnVOSHZvRFFqdy9YVzBsRWdST2FFRHROdEFxSjIw?=
 =?utf-8?Q?bQsVNKUnZ7H8SLVPF259nP5t7sjDJ4HLoK/kKkmDwXgYw?=
X-MS-Exchange-AntiSpam-MessageData-1: km0EiVcFTd5noKRM+Ux6rwhHw6cKFUlwFSA=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 36978867-adef-4bf6-5528-08da244e104a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 10:51:32.6952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QyLYHanlImVVRtqrRiCVTjxkxA08w6I+0JwzwLiv1mtepbkYhjyjGuru4xc/Ef3apR5vrSbsoVDHfwU65Fx8+VBH3P3b009L7KKJEUBs0AybRALJZggI+VD2JvXRwaCu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5150
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2837

Hi Paul,

On 4/22/22 03:40, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
> 
> This check is new in kirkstone.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   documentation/ref-manual/classes.rst   |  5 +++++
>   documentation/ref-manual/qa-checks.rst | 10 +++++++++-
>   documentation/ref-manual/variables.rst | 15 +++++++++++++++
>   3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 13cc2bb..a084ace 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1039,6 +1039,11 @@ Here are the tests you can list with the :term:`WARN_QA` and
>      cases, such as dynamically loaded modules, these symlinks
>      are needed instead in the main package.
>   
> +-  ``empty-dirs:`` Checks that packages are not installing files to
> +   directories that are normally expected to be empty (such as ``/tmp``)
> +   The list of directories that are checked is specified by the
> +   :term:`QA_EMPTY_DIRS` variable.
> +
>   -  ``file-rdeps:`` Checks that file-level dependencies identified by
>      the OpenEmbedded build system at packaging time are satisfied. For
>      example, a shell script might start with the line ``#!/bin/bash``.
> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
> index 3364311..e881697 100644
> --- a/documentation/ref-manual/qa-checks.rst
> +++ b/documentation/ref-manual/qa-checks.rst
> @@ -154,7 +154,15 @@ Errors and Warnings
>      ``FILES:${PN}-dbg``. See :term:`FILES` for additional
>      information on :term:`FILES`.
>   
> -
> +.. _qa-check-empty-dirs:
> +
> +-  ``<packagename> installs files in <path>, but it is expected to be empty [empty-dirs]``
> +
> +   The specified package is installing files into a directory that is
> +   normally expected to be empty (such as ``/tmp``). These files may
> +   be more appropriately installed to a different location, or
> +   perhaps alternatively not installed at all.
> +

Can we reference where those changes need to be made?

To ignore this warning for some dirs: QA_EMPTY_DIRS
To install in a different location: do_install + FILES: variables?

>   .. _qa-check-arch:
>   
>   -  ``Architecture did not match (<file_arch>, expected <machine_arch>) in <file> [arch]``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 4803578..47c8a8f 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6084,6 +6084,21 @@ system and gives an overview of their function and contents.
>         In the previous example,
>         the version of the dependency is :term:`PYTHON_PN`.
>   
> +   :term:`QA_EMPTY_DIRS`
> +      Specifies a list of directories that are expected to be empty when
> +      packaging; if ``empty-dirs`` appears in :term:`ERROR_QA` or
> +      :term:`WARN_QA` these will be checked and an error or warning
> +      (respectively) will be produced.
> +
> +      The default :term:`QA_EMPTY_DIRS` value is set in
> +      :ref:`classes/insane.bbclass <ref-classes-insane>`.
> +

we usually just use insane.bbclass and not the path to it in the git 
repo/layer.

> +   :term:`QA_EMPTY_DIRS_RECOMMENDATION`
> +      Specifies a recommendation for a directory why it must be empty,
> +      which will be included in the error message if a specific directory
> +      is found to contain files. Must be overridden with the directory
> +      path to match on.
> +

This is not explicit enough to me, we shall provide an example or 
rephrase the last sentence.

I can suggest:

path to match on::

   QA_EMPTY_DIRS_RECOMMENDATION:/tmp = "/tmp is expected to be a 
temporary directory and emptied upon booting"

or something like that.

Cheers,
Quentin

