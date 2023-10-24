Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09E9C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 11:33:18 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.73])
 by mx.groups.io with SMTP id smtpd.web11.15794.1698147196927889456
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 04:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=LcOaROxG;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.73, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVRBoLrK+gcAyZ02LTwauML9yCOb333lxJqwQSC/fbEsNZxNlpc4yFZGH+Knc4qbpqEz091pEW48v0xLO0MInBM85jXTqUgM+vMGqLpqxToc54Tg+kXzogoL6I57MoHTmAOPg5y+TwExsnTYl2s3wm5r4F67tjVghH5YOfyxNrGCE6B/9AyxylomBCXFNA6K7n5YmNTfQoPWJ46RCjYmNEsujHbUcCexg3v37DaNJd+FiSOj3drmaabMIrAOmzRx0cTmb9sf3HK0e+nlNe4Vj9EJ1AzFJjnQ0DkuPgUtAumqXkl6YhomB/dYNWoLPtraE+mGvvGwSBB5e51W967HbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2gQg13h2eAkMuxLaQkysdleLnoiryrf1QQCAJ5PLsQ=;
 b=aXUnaPREph5wz2dDH9dh2RBhJB52FsBT2ona7Q2jJMY5Sxrugty0try6VFFPJtvcGW1B4s8JLAHU8ODuJyA3P/lsbTwLumbuGB87yjrgPalPUeUCVDOo/shYUZhc7eJqT+Eg8aefWmFakWqUDypB1TpoMTwWTzAR5ysGH4/ysKkVil267mSyqZA0+tdqU6spUkhYldsM2B18gCIcLQ06SdSdotvH0LGL+mn1vlcXCmnDEUAplYP8I/syh0dFh7JatWjUavL753NkF58mPxgLjtaTyQqgowMwkcKEMFyAbfsxn1ztM/HP+8W8UXUxEyy9Jzvee7f0OeLhB733QhB0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2gQg13h2eAkMuxLaQkysdleLnoiryrf1QQCAJ5PLsQ=;
 b=LcOaROxG/2+/juY8G8YZGGDXbYxD7oNe5dgvgaWd7O3w2BsCdakGFbG6j40Yl3cQ1Os51Xlu2pVYWaVth6uV7TwGLqhucVo64jnwIns77nR6gjj2Z0HO2HT7vG3HpIQYzTXTTpOd2TKYY6lSMOx4OXLlfe/BplJqJ2J4Yxr8bDBUsIzHNsscD0HxBo7U752mqtB1qQOM3M14H7CLMsK3GXyjUap9dfPhN9LzkpU83n4kOAectg3fCKV0FwP1EGjzBmVQYgYEJogKyiD7SF54h4Ei2kSv19D2lE/VZypqBQRuoM5fo6MHG+eMVPs7+f1/IU3beNHgr1yxmEB93SnSPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB9142.eurprd04.prod.outlook.com (2603:10a6:20b:449::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Tue, 24 Oct
 2023 11:33:12 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::8b7:c8b9:d800:8b4d]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::8b7:c8b9:d800:8b4d%3]) with mapi id 15.20.6933.014; Tue, 24 Oct 2023
 11:33:12 +0000
Message-ID: <c6133ead-33a3-42d3-95ee-fc7980bad8ef@theobroma-systems.com>
Date: Tue, 24 Oct 2023 13:33:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3][docs] dev-manual: add security team processes
Content-Language: en-US
To: rybczynska@gmail.com, docs@lists.yoctoproject.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
References: <20231023183323.10676-1-rybczynska@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20231023183323.10676-1-rybczynska@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0039.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::28) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: e70f5f35-b12d-41bc-c65b-08dbd4850186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lsUuCdKAv0F/czqG0mLus+df2jxPo7TpsN6tNgevTNNRW6If2FM2yl3rExpj/rEgu1dZESsFe2lyFlqCWw+jNr2uqEZ9NR0beXO7SVDtKpR3uTA2OJvLu+p9knNNKvQmGgVIO1B1Gx9eFR79SVdbvN8Ynfbc3eZQA2B5Mj2YUT5VG/xWQRmQhS/xHtehTUAPp0e3StrkqCCaTrw+3ZGYUPs72t/oyJlWq+cIltx3cWuuqeXN4FbZraxnbb16mOsELdFCtFpNBoGWmCGUIjr4JD/h9CjTCIOeDj03lFHYfwEMGed7i5eddEMSO8sFWMWK+u2myGNIGBGgTtFvRVkFoHNJlcIqQSDr7uf9mUWJtoFfrXhbbIQiVYNpN4WlOAKhztdTnWSuirpPqGGZZpzlVjb6aDRagZABwEoBfQejUywSF0IotpKiUh+6qYxzHiU1Dudwu/nDJSPEwGoPFD+lztjruowHy9ibeV2/dJEoPKupX028Y2ZblX6QytX9CmWqkvkfeK3MS2VDMEfAzyf6EGZyNgi+T+osEv8fDaI3Qm+4iElPwG9ExO2l4GrqeKigt33J4TxdSYlpOFVAldkYn2xg3h6M36ClBzuYLKnNsmfyyQQzNH5IcMk/fEdGn5R56UCeU/+9UQ2kMpUJBg5j7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39850400004)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(6506007)(6512007)(53546011)(26005)(6486002)(966005)(478600001)(66946007)(316002)(66556008)(66476007)(31686004)(86362001)(38100700002)(2616005)(36756003)(31696002)(8676002)(4326008)(8936002)(41300700001)(44832011)(2906002)(66899024)(5660300002)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V2JmYjZQdmtvclZJT3FQRGZ2UDhab1AvYmZMZ3hhNzUvOUZBU2h2TU1DeHlU?=
 =?utf-8?B?U3lpMHVYZzRBWE8ybU5Lbm5CakJCZlFaMGcwUUY5QU9JeGRmVDExR2dJeWZ5?=
 =?utf-8?B?eWRTbWRNZ1JRNHRTS1F3L2o1OFB2MFoxZ21IbVNRRTdhNDBGQTNTdG45T1J6?=
 =?utf-8?B?bFNCL0haRzlSK0Juam5INlUzUGpzSDNMa244aThiNjB3UkZjdTRIRjlhTXFP?=
 =?utf-8?B?K2hEaTNQejhML1hwYm5xck9YNHlZSk1wYm9vajlVS09wYTBYajNsM3AwTk9M?=
 =?utf-8?B?TlVaVWo2QTk3bzRwNXJEYWMxbkRPVEhINndxVDBIWUk1R2gvd3hEZ3dnMVJw?=
 =?utf-8?B?VjE3SW5rYjFpVU1XS1R3K2JOMmNucnJlT256RER5WnJ1dU5Pc0RRN2dSNGUr?=
 =?utf-8?B?U0h3RzJ6bjErbVg3clZOUlFyNDdtTS9xYndESjRWYnB1eXoyWk5FUjJFRGZW?=
 =?utf-8?B?QWtYcE9DTUErYUp6d3Q5dkhuOGMrTTBhTTNxZU45dGVwbnplMkludzcrbGpW?=
 =?utf-8?B?OGtzQnJaSnZtK0dBSDJKdFd2OUtKQmlHODBMbXUvdnRmL0IvV3VIdXhuaWQ3?=
 =?utf-8?B?V0hKUXJTcHRhSHl2VUErMEpEa0krb3A3MnlObTdGeE82UVoydThMUE9CVS9G?=
 =?utf-8?B?RWQ0SWpDRmdhRi8wVm1MNjMydnRKeTYrRDhQZGZhSkx1YUVnZmR1SDBVQmFo?=
 =?utf-8?B?SUtLR0x0ZmhKcmFoU09sWTNlUklLdnYzUElsWWVOTmdBbWh4MnV6bkpZUlVG?=
 =?utf-8?B?OWRQU29rOVBkOXRBd29NbEFUMWp0YUhJb0JwS1lxbVdJcmxnT1RxTWhBK3hh?=
 =?utf-8?B?UTJ5VGVrRlh0ZlZKbW5XTEo0SVZjNjZJZS9EcjVtd3lURERYTmVKSTRBbWZp?=
 =?utf-8?B?bTJKc0VCcENNaXFUNFdzTGdjZ1Q3UDc0aFRTRXBxaG1LWnFmNFN0QklXS0c4?=
 =?utf-8?B?aEY2enNrUnlEbVl5Y3pNMXNWamw2N2J5Z3ozWjI3SVFvRFV6bGVYYkZqMDhu?=
 =?utf-8?B?Q1ZzK0l0Nmd1cGE5VUdWSHZERUNiTlQzZW5YczZ1ZzFkbkZnQ1NZZk4vVk1P?=
 =?utf-8?B?eE1RSk5ISjJwaUN4NEV4dUE4N3FTdkNaSkl4eGtqR2pWeFNzYlI0eURSMWxH?=
 =?utf-8?B?OHpUeUt5cEt2R0huQ0NiMFdYWFk3ZXlPMlRuZHdWSmdtSUVqdDYyOWQxSTB0?=
 =?utf-8?B?QzQyV2tTOXVxRWcrS1JvWjF3czk0QW1rWnJsaFI3YURqSGxaN2R5bjFnMCsw?=
 =?utf-8?B?SnRRWUh3VHRQa3Q5NVNjKzJTNVFDUXl0Y3B3d09tMEtZMVM4UzZsa1I2U3lW?=
 =?utf-8?B?NUdrbjg1NW8zM1hvcUY2RE5ZM1hSdHNqMkVXVHVoMVBqcFpyS1piZzlid2gx?=
 =?utf-8?B?RkZ0bkp2b3E3cUljSmNJUWJjYmpnYjJXaC9QemdFK1J0ak1Ea3JSWkdZSTNQ?=
 =?utf-8?B?Q05qckQwMGpaZzdnOWxKVVVwaVc0SGJ5b2hodEtLR1FvQnpzMU90ZnVYNERv?=
 =?utf-8?B?SFpGZld3VGZpejdnRkRza29MQmw2VUZ6U0tBQlFmR1pZd2x4QVhXRU9rU1lr?=
 =?utf-8?B?UFFUTVRKSjU1NmtIaHUwNnU0ZndHd201TndKN1JDQm9jRkJMY3luZExoaVVG?=
 =?utf-8?B?dVlnS0xPNms3QkwwK1RsVUlncmpBYWFoTEQ0ck1Rb1lSZHZXUzBaOGExeGh4?=
 =?utf-8?B?SnhSUVNFVEVzcFFNaFJ2SDFDWXViTTE2T0xMNm1GOWJRV3F3SnArdmNBNW9h?=
 =?utf-8?B?OHJHbEdFVXZ2ZjJEYmxPRURRSHBobXB2SDViay8wckJ1dkxldVF1NzhtQlpk?=
 =?utf-8?B?Wm4vRGZLdTVGRmc4R2R3TTJQM1hhWEJFMjl3cHB3bnpTSitmSUZHRzI1SGUz?=
 =?utf-8?B?cFFRVWFOUlkxY25GK2svVU9lZmUvaHNwdlAzTTBGR09FcUpYK0d4YU5LQVNQ?=
 =?utf-8?B?Mi9EdzNYM0E4NlIrMkFoVHZvZHlvdnRhRUxtRkM4SHNwdnV6TmRzRDBxVFZX?=
 =?utf-8?B?VjNlelY1UkZnY3N2ZWtyTVJEK1ZsOWJUVFdPUXhKMUNlbEQ5dTk0ZGZ1aHV2?=
 =?utf-8?B?SVNhc0Y3Mjc3ZytyS0FGSVE4dE9teEtxZjRnMktNckpreTRoMWtkcnhpSTBx?=
 =?utf-8?B?WDJlZDNiVFFTOG94Q2hBMEFZUGJVWUNtRXlGUEI2Y0dYWi9VTlVDd2tkWENH?=
 =?utf-8?Q?tt6esyX46EdsLqH/SeLz2kY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70f5f35-b12d-41bc-c65b-08dbd4850186
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 11:33:12.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5je8atoiEkK1RHVJGfuT71Yd4XHWDlATIO0nkN6tMv3lEc6YHX82JUwDxKstDpipyhds6NjPIB2+ocir4w5xnwmwt84Z7v/Xr6lVL9eVI5+zhzgcXFXaqcOrt+rWlmV3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9142
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 11:33:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4460

Hi Marta,

Small nitpick.

On 10/23/23 20:33, Marta Rybczynska via lists.yoctoproject.org wrote:
> Add the initial version of the section on vulnerability reports,
> operations of the Security Team with a
> transcription of https://wiki.yoctoproject.org/wiki/Security_private_reporting
> 
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> ---
>   documentation/dev-manual/index.rst            |   1 +
>   .../dev-manual/security-subjects.rst          | 188 ++++++++++++++++++
>   2 files changed, 189 insertions(+)
>   create mode 100644 documentation/dev-manual/security-subjects.rst
> 
> diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
> index 3106b90a4..9ccf60f70 100644
> --- a/documentation/dev-manual/index.rst
> +++ b/documentation/dev-manual/index.rst
> @@ -42,6 +42,7 @@ Yocto Project Development Tasks Manual
>      runtime-testing
>      debugging
>      licenses
> +   security-subjects
>      vulnerabilities
>      sbom
>      error-reporting-tool
> diff --git a/documentation/dev-manual/security-subjects.rst b/documentation/dev-manual/security-subjects.rst
> new file mode 100644
> index 000000000..7a388784b
> --- /dev/null
> +++ b/documentation/dev-manual/security-subjects.rst
> @@ -0,0 +1,188 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Dealing with Vulnerability Reports
> +**********************************
> +
> +The Yocto Project and OpenEmbedded are open-source, community-based projects
> +used in numerous products. They assemble multiple other open-source projects,
> +and need to handle security issues and practices both internal (in the code
> +maintained by both projects), and external (maintained by other projects and
> +organizations).
> +
> +This manual assembles security-related information concerning the whole
> +ecosystem. It includes information on reporting a potential security issue,
> +the operation of the YP Security team and how to contribute in the
> +related code. It is written to be useful for both security researchers and
> +YP developers.
> +
> +How to report a potential security vulnerability?
> +=================================================
> +
> +If you would like to report a public issue (for example, one with a released
> +CVE number), please report it using the
> +:yocto_bugs:`Security Bugzilla </enter_bug.cgi?product=Security>`.
> +
> +If you are dealing with a not-yet released or urgent issue, please send a
> +message to security AT yoctoproject DOT org, including as many details as
> +possible: the layer or software module affected, the recipe and its version,
> +and any example code, if available. This mailing list is monitored by the
> +Yocto Project Security team.
> +
> +For each layer, you might also look for specific instructions (if any) for
> +reporting potential security issues in the specific ``SECURITY.md`` file at the
> +root of the repository. Instructions on how and where submit a patch are
> +usually available in ``README.md``. If this is your first patch to the
> +Yocto Project/OpenEmbedded, you might want to have a look into the
> +Contributor's Manual section
> +":ref:`contributor-guide/submit-changes:preparing changes for submission`".
> +
> +Branches maintained with security fixes
> +---------------------------------------
> +
> +See the
> +:ref:`Release process <ref-manual/release-process:Stable Release Process>`
> +documentation for details regarding the policies and maintenance of stable
> +branches.
> +
> +The :yocto_wiki:`Releases page </Releases>` contains a list
> +of all releases of the Yocto Project. Versions in grey are no longer actively
> +maintained with security patches, but well-tested patches may still be accepted
> +for them for significant issues.
> +
> +Security-reated discussions at the Yocto Project
> +------------------------------------------------
> +
> +We have set up two security-related mailing lists:
> +
> +  -  Public List: yocto [dash] security [at] yoctoproject[dot] org
> +
> +    This is a public mailing list for anyone to subscribe to. This list is an
> +    open list to discuss public security issues/patches and security-related
> +    initiatives. For more information, including subscription information,
> +    please see the  :yocto_lists:`yocto-security mailing list info page </g/yocto-security>`.
> +
> +  - Private List: security [at] yoctoproject [dot] org
> +
> +    This is a private mailing list for reporting non-published potential
> +    vulnerabilities. The list is monitored by the Yocto Project Security team.
> +
> +
> +What you should do if you find a security vulnerability
> +-------------------------------------------------------
> +
> +If you find a security flaw; a crash, an information leakage, or anything that

I assume the semi-colon needs to be changed for either ':' or ','. Or 
maybe em-dashes instead (---)?

Cheers,
Quentin

