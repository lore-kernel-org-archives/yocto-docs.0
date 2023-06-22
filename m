Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA32CEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:21:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web10.16040.1687450911986475194
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=flgzIr+O;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.56, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSHuAZ9YQ8hXky5mglWkeuc+i5lhiJtqfT1QRtCLxYUR8LK/G4jnuPpAjswkSOES3sFUmOmxlMaueRS1ORuS8Acvs+4t7rPL3ade1JXU6QdtS+UKL5KlKry95yE3lw3DJirxEweijyKo/SGB3a7fXVLjCtnRLJ0fUbzikm8h+LaRZ+CgGFKd05UNPtY4Y5pQ0LthG7F+a/XG5XmeCYiV3KMqwJe3W0J/BNR3wnB3zj9l0atEE4frBWF6VgD4QLWTcjzjWoXwGwG7nc7unWOErUYznubs8tuubiBYZ+o/VIaI+ICUkIKvZ+KTjHYsGcne7fCDJWd4Y4zJOn6SVGom0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZf58yWvszuqBHLldhfwspvX8qFlxRyEEKM4A8R7TkE=;
 b=O/PUCzsL9g7Tsi+vDduSkNdpSLLenYdxMOi6aTEDDrlwDboHmvquTMvPZKpgM81U0GISp/SYwbdyTL2g4olb2/ay9/T7U4HvnEEdG9IYyhLdV8p4UCno12cVvGWOR/8AKU46+pChL3FEnaq4El+fNSXeLMGpXVJqeeLe7iuO1zW9Og3C+lKtlP2W8P72xzvTStPOIx+at9m2y4ddYzcb3W2+/HPS3AXZ0+PTImDnuqbt1I15bnbGJVllb998EGa7iLehvdeoEAID5JFeWirkM5SKghQdxwbBOKnnuzrRRgl4/gn082hMDA3E7+QhS9ztVx996xlgspGp42JiHGbm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZf58yWvszuqBHLldhfwspvX8qFlxRyEEKM4A8R7TkE=;
 b=flgzIr+OqIF4DC5PE7NNdhxRobJcNeQUBkXUOEzf3FJKiGHTFpIc5G1skWomRbBI+WjdCFmyBbQ2Yt4Ex72bLl/GhzoWYAIRi6FNNsVAlsT5IqUSeEt3niVjWs9szD4SzIZMYPim8X1a0IN8hgSieeNY9YTh5trCpsbtXfA1TD6rRdjhPIFo6bVV3srd0Tt/myN40PhUr2OsDHV10ucLXXKSamrg8exY5Snu4Si+PcjApcL4x46QhQsAOCT3b4BzwNg/qxZa5z+PJ+hYGNC4Z5Uhud05zaAGno1Wh1b5+CTLgnOH+FNZc/YkkdSEByUlxRQwc63p8WemE3AiS0Tyiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by VI1PR04MB6895.eurprd04.prod.outlook.com (2603:10a6:803:13b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 16:21:47 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::f868:358b:fd4d:31bb%3]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 16:21:47 +0000
Message-ID: <c31ef3ef-f940-10cf-b965-83f5a64ca3a5@theobroma-systems.com>
Date: Thu, 22 Jun 2023 18:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [docs] [PATCH v2] ref-manual: variables.rst: explicit variables
 accepting colon separated lists
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230621091758.1164139-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230621091758.1164139-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|VI1PR04MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c47f5d0-7e01-4054-f611-08db733cc6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QTAj2wPLxVjUf7P6slChi7VYPBFamheDvOvFrrQ/+o6IWdFw9E3d+k7A6EbCtrMdeqYy91xp0PNnBixfmrH/5qyfHLSmp+utu4CkcglblbLIVy0gm/X+Gm3inn/Lo4tUIi6opcuAMAtmsUeNCWdVtlF8W5Df6TjIPAsoQpGh5EPPi8tsuHnM5voFuxWfwuWD6oQtiWcBHoVYqGJSfxkdqnKhabzGuCTz8oarbAibLLhClwmuafsWh/Z7PjFr/hxqP4VggBIcGfn81HnJjWmn7KjVqTu1D0oFa6I4ZwJd/9JSr2QYgXag+yttRt5NHEiGGtL7fSm/E+J7PUEx/dV1/bvinVcLjAAt0Ov3Q0GczlctQEAR0sibKQuxLYjQr84DA/f+jRPVNuPTUZCJxttuuXX5fweY1imYYrgTCicj8A6EyycJhra3uuYw9ZTE0Xxs2eq9Dzvjj3gF0cGdtfojxGPVRJcXphdvC0zDg7w0/fKwLg2Aq/WO6ktUiYX91i9giLbXOfYijG+502K5Xp6LUoZqHG2lxEOJPJrF9FHhMwT7uSmbIwuQU1vRECvDfwB9gsqebI5gzkUA5w/SFhLEq0qvNJFHYvBr0dRntxOWlok=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(136003)(346002)(366004)(376002)(396003)(451199021)(6506007)(8676002)(8936002)(31686004)(4326008)(66476007)(66946007)(66556008)(36756003)(478600001)(316002)(5660300002)(44832011)(2906002)(966005)(54906003)(41300700001)(86362001)(31696002)(6486002)(38100700002)(53546011)(186003)(6512007)(6666004)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mmo1eWJFSlcrcTlwUTY2dmFkSHl3cWtWMTJmSXVXUmhIdjhzWEV3Q0FGYVBh?=
 =?utf-8?B?aVFsRjBZbUM2Q0YxaHpWbXZka011S3dCZnBVODBaaEtqMVp2dkZIYVhNemU0?=
 =?utf-8?B?cHBnZjgvaU9DMUdXT0RNbnBQZjNFM0RQWVRuUXJBWnRvblp1SHZwcjlheDFy?=
 =?utf-8?B?ZEZPRURFcmFwazJVVjBVdC9pd1AxaVJFRmR5SVVtQ3N6S3U5WE5Cbm02WjdZ?=
 =?utf-8?B?RGV1ZnY1RTNVQzEwVUZwV09FSTVPYkUrT3NLMTNOTCtwdUxCNVpqM1JrUjRu?=
 =?utf-8?B?NmZ5VnlGbE9MOHFHbzNjUlEzRWJERGt6Y3ZCbjNiME42eCszMHVvOExQZ2ls?=
 =?utf-8?B?UHBJd1ZWNUovQ1hPaTRuUTNzOHBIeXoxTUhBNDcxcGROaE5tWUNNL3dDUzV3?=
 =?utf-8?B?U3pQdlNRWmRMelI2OWY0MXJEQWoxR1NTLzRheGN5ZHVJTmd1ZEMxemp1d3oy?=
 =?utf-8?B?LzIyT3JReFQ2MnlHaUNobDF2TFJhVEhUWGwyQnZ4aU0ydTZkK2tZM0tvTlQ3?=
 =?utf-8?B?dW1WU3hxUFVMa1p5SXJZRnZsYkFOM3lkNkQxWWJFazk0S09WQlAvVlVkbjJn?=
 =?utf-8?B?S0JlcG9SSlo5SnUzaEtaSis4SkNJN2V0QlFmMFREZjh5cHhrWkNWMGROcHl3?=
 =?utf-8?B?THJTc1hhZHJhYmtPd1NLODg0cjR2dHErSXkySTdEUDNsR04ycCtJbFVLUk1q?=
 =?utf-8?B?RmlDZDY1amRXRjFwejhSMmx3UDg1S0ZRMXkzZTNXdWhKUitBaXFCT01kV1dr?=
 =?utf-8?B?cGJkbjU1eTVCV1JpanhDQ2Ribm9SY2pNc3FCQm1MNEd0TWExcThzMnJpbUZn?=
 =?utf-8?B?N0dUaG5aNW1PMXVvYnloVmpybHdidTR0dVVIYXI4NlA5TklId1daeE16RHpG?=
 =?utf-8?B?aDdkeStCTFFHLzJnbjNDZWFsdC9IU2tiV2piR0ZGeVlXSDJObVVZdnRnQkEz?=
 =?utf-8?B?VE51WUZodkU3bHlCV29wbmRKa1RNL01aL1lLR3hlSGlxRlBaRHVEcW5BaHZV?=
 =?utf-8?B?T1g0UEIzOGxOU1RqR3puRnh5TU1xcGFWemRHZ2tTRVp2N3d1S1hlWDZrcis1?=
 =?utf-8?B?U2N4RzlHeE1za25RcHRmVFQ1bWtSR3dNOEtxd0tPMlZsYlFJVjlZUXJQOFkv?=
 =?utf-8?B?YnEweXh2TGNvWDlrUGg3QytEeW5vNnBLUjMvdWNmZVFqMjhtRkdSb3hCUmZT?=
 =?utf-8?B?akZoOFZsVXdGRml5eERFK3BvdDk5VVhpOFVPUjcwek1kdkJGTXFNQm1XbGMz?=
 =?utf-8?B?dTN6SklTOXpRTGhqM3U2a1NvNUs2cy9vaWpxK3F2QnkyZVZPUGNDNnlXaDhx?=
 =?utf-8?B?dm5GS0xCZHhRUFZ3dG5jT1lYWUtsRHFrMGxmOXdIR0JkYlBwNWdFQkQvbk1V?=
 =?utf-8?B?UDhvYTNzTnRVSk5TVjZ6aU1ybkZPK0ZycTJLbkh0S01qMFdWWUtIQWNlcVdD?=
 =?utf-8?B?MytOamZmRk9ZTGNLT0pCLzFnalJIckxIOVVITmhaTm1Dc2JXK1orTHVHZVE5?=
 =?utf-8?B?K3pYTU1DUklsaFdKaDJraXJBbHdTbzJidVpzNEZsM0FqSmE5SXFlVDRDK3VY?=
 =?utf-8?B?YmdnRzI1ZXZjaWZMTmV3QVhaNTJIWlpxOFRTVVZzSUViRHJqS1Fpb1dUelNG?=
 =?utf-8?B?S3p5NFVibTNsQ2xqdmc5WGwybVlvdHVNM3VENDJPckVMZzNlTVlmSUxuSGVX?=
 =?utf-8?B?TVdGbzRuNmtPMG02OUplYkZ4ejlhMkpjTGNXUkYxODlzT0JkQVFXWkZ4Mkln?=
 =?utf-8?B?SzlGdlovM1djNUJSaC9XYW0wZGl4MUZ0eTd5cWZobFZWa3FpKy9iRWJQZUx1?=
 =?utf-8?B?dGFnMDloWENldGdkVjM4RnRjczRaQzFDUGRoRDFlcmFrQjJlU05yTExMK1R0?=
 =?utf-8?B?ek1uY1NZSWZkY2NPUmlWTFFtbzJ5OExDQkpEVTlLeUxKKzVvVHFKVGRKeTNN?=
 =?utf-8?B?WG1CK0YzNnVxUm5Ra2J5dStsZ0FMMFNwMGpjY0NZYTg4MUZFSERncFpwOHhS?=
 =?utf-8?B?UTNLWUhaNWlOUkNzV0FDSmdtQnFGUEhMNWVTRy9wMFluYTZLUXI4bm0zVGtm?=
 =?utf-8?B?ZlBrNFI2UkNhRG1GbFNyK1l5WkdtQ3p3Mm9TWVZDM2ZyeFo4UGZ2Y25YczhB?=
 =?utf-8?B?SjZldjRjNzV3ZTZoSzQ1enVDeWhqTy81OEtYeTJHYm9BeGxDaGx6OXJReHpu?=
 =?utf-8?B?Tm9jR2tGZHN5V0tML1hBc3QzWG9jOFNxOVAzSFh0YVBmNVE5QnA1Mlk4V1Rp?=
 =?utf-8?B?VkpsQk1KeWtjMHI2TmZNQkI2cUFRPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c47f5d0-7e01-4054-f611-08db733cc6af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 16:21:47.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+XGbTs0n1+nyGgWaE0W8/j7XWnDjswFU+ZBgifkfhfKhn4eqSTBIDKHa0VXmbyiqjrJYJPng80NHMUlyQ+ApLNGxmpathTZt0IaGWxaav7DHyhL8Dzg6ENQ+I3BWXGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6895
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 16:21:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4026

Hi Michael,

On 6/21/23 11:17, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> [YOCTO 15128]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> ---
> 
> Changes in V2:
> - Include SOC_FAMILY (review from Alexandre Belloni)
> ---
>   documentation/ref-manual/variables.rst | 39 +++++++++++++++-----------
>   1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index cba3cf5d07..2c2ac9fedd 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2200,6 +2200,11 @@ system and gives an overview of their function and contents.
>         is included in the default value of
>         :term:`OVERRIDES`.
>   
> +      Here is an example from :yocto_git:`meta-poky/conf/distro/poky-tiny.conf
> +      </poky/tree/meta-poky/conf/distro/poky-tiny.conf>`::
> +
> +         DISTROOVERRIDES = "poky:poky-tiny"
> +
>      :term:`DL_DIR`
>         The central download directory used by the build process to store
>         downloads. By default, :term:`DL_DIR` gets files suitable for mirroring
> @@ -2756,12 +2761,11 @@ system and gives an overview of their function and contents.
>            FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
>   
>      :term:`FILESEXTRAPATHS`
> -      Extends the search path the OpenEmbedded build system uses when
> -      looking for files and patches as it processes recipes and append
> -      files. The default directories BitBake uses when it processes recipes
> -      are initially defined by the :term:`FILESPATH`
> -      variable. You can extend :term:`FILESPATH` variable by using
> -      :term:`FILESEXTRAPATHS`.
> +      A colon-separated list to extend the search path the OpenEmbedded build
> +      system uses when looking for files and patches as it processes recipes
> +      and append files. The default directories BitBake uses when it processes
> +      recipes are initially defined by the :term:`FILESPATH` variable. You can
> +      extend :term:`FILESPATH` variable by using :term:`FILESEXTRAPATHS`.
>   
>         Best practices dictate that you accomplish this by using
>         :term:`FILESEXTRAPATHS` from within a ``.bbappend`` file and that you
> @@ -2822,12 +2826,12 @@ system and gives an overview of their function and contents.
>         recipe to correctly extend the path.
>   
>      :term:`FILESOVERRIDES`
> -      A subset of :term:`OVERRIDES` used by the OpenEmbedded build system for
> -      creating :term:`FILESPATH`. The :term:`FILESOVERRIDES` variable uses
> -      overrides to automatically extend the :term:`FILESPATH` variable. For an
> -      example of how that works, see the :term:`FILESPATH` variable
> -      description. Additionally, you find more information on how overrides
> -      are handled in the
> +      A colon-separated list to specify a subset of :term:`OVERRIDES` used by
> +      the OpenEmbedded build system for creating :term:`FILESPATH`. The
> +      :term:`FILESOVERRIDES` variable uses overrides to automatically extend
> +      the :term:`FILESPATH` variable. For an example of how that works, see the
> +      :term:`FILESPATH` variable description. Additionally, you find more
> +      information on how overrides are handled in the
>         ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
>         section of the BitBake User Manual.
>   
> @@ -2842,8 +2846,8 @@ system and gives an overview of their function and contents.
>            build system.
>   
>      :term:`FILESPATH`
> -      The default set of directories the OpenEmbedded build system uses
> -      when searching for patches and files.
> +      A colon-separated list specifying the default set of directories the
> +      OpenEmbedded build system uses when searching for patches and files.
>   
>         During the build process, BitBake searches each directory in
>         :term:`FILESPATH` in the specified order when looking for files and
> @@ -7577,9 +7581,10 @@ system and gives an overview of their function and contents.
>            SKIP_RECIPE[myrecipe] = "Not supported by our organization."
>   
>      :term:`SOC_FAMILY`
> -      Groups together machines based upon the same family of SOC (System On
> -      Chip). You typically set this variable in a common ``.inc`` file that
> -      you include in the configuration files of all the machines.
> +      A colon-separated list grouping together machines based upon the same
> +      family of SOC (System On Chip). You typically set this variable in a

nit: (since it's not coming from this patch). I believe it's supposed to 
be "SoC" (c.f. https://en.wikipedia.org/wiki/System_on_a_chip).

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin

