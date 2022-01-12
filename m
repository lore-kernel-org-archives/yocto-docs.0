Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2E4C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 14:14:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web09.23471.1641996892575174151
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 06:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=lDH4YgG/;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.81,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iW9cvEQ7djGYrFO7YpnLwNcUi82rG/GpvFyE4T2LFClRJ+XKSyQCZWb/DC4Y48eZpI8E+uEnF3gmWOWiTJItorbKvN6tIGmN1uRJOQmUfv8+yFYnW9nG7akimVijdU787IL/71CpHnnD8CToJd7yPuAdiHzHuNp4R1+UKus5k/TADhAj5z/vppzG1IHphEUlh8ytQ3zKk8K5IlcP/HVFbaDMceVoKFxgKGAkwoQZp8OtYZpQARdgWlXPm/mjmfqVlu70uoiVtZYK0L6p4clf7tmHiAZEFsOhifjwp0cToyZ+zCg2G8QsgW5uRdPnf2bAOcjJea4W/oltmp69GBrVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvCBymwudsF6NU9WaKUbKz6gBqu3E3rGaHe6/sf0p1s=;
 b=G/GXxSthjIj/sEVH6Zt6iEcQzn4BvVEWJUGuxeiDijYw+duOIOkRFQAYyQgTEYAIGoBK2XS+wIb5xvNQQZHP1NwY+GnCUj2cnS+A3wLhrvJzewQx3gtA89Qb74c2px1VdwblL3ptJ0+lJ0PJ6FoUtQLweP9Io4kxI+WydJFj4MJpPOUnH0OAossHcJw+Twz0jdTIHJDZCyg5PZrAx4/oCEVtO+444gVHzMKG4HZOJHfmfuDvxDrB483palKDUSfO+YRNaq0eH+A/E8CyXKFNJCj5AR51lcLe+cf8M6IMJqKOFG5kuNAufKrm5jvwLTzUs04IA4+xh8WAVCU4t55Udg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvCBymwudsF6NU9WaKUbKz6gBqu3E3rGaHe6/sf0p1s=;
 b=lDH4YgG/umnObHoncom4r660uQeK19lgBPoYjI+FsmKN5huoePKpeHxyiP3q5LR84ZvV3p8ptXLbI/8ooglomIbnRZDvgiIvzWQmEETb5/VqmfuXc2BWnWmeplvQGhTRpN5Np43I6Wg9IhEo0pzn8UQy3/0SY6X6lIpQuE0sBe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB5965.eurprd04.prod.outlook.com (2603:10a6:803:da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 14:14:48 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%7]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 14:14:48 +0000
Message-ID: <fc3b98e4-babc-b155-01e0-2596e1880881@theobroma-systems.com>
Date: Wed, 12 Jan 2022 15:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH] manuals: simplify references to class sections
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20220111165923.2243490-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220111165923.2243490-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0060.eurprd09.prod.outlook.com
 (2603:10a6:802:28::28) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ebf7a44-ddb5-4445-c4ac-08d9d5d5e431
X-MS-TrafficTypeDiagnostic: VI1PR04MB5965:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB59655072C6AC4015E867404BC2529@VI1PR04MB5965.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	69Y7I5imRB/FPD/yx3tx3g5isCP1+sJMOD1uWI1+yiO2HYZDD/VFtyB+JmET70RSTuVp8n9ncnsjcwDr9XGqQhXBKxmA7wql+eRlZpLpJNXDCH3QNpAkmD9zuihOkbV34yOlb/1Lz/TUkuZaWeDFUjNe2SsiRoby/RBFlLo1xq3EDG8e1XYatncxkGb3tRQZg9Dmf6QpcCaeTLLrbRLESi7jxbo+HG9hvsF/NDlqQGIl8vYABi7a1HJms58+BcvZFFHM/Im4b8NqfHY0XF5kbzQiZJbhK4SFoAYixmi0OWrXU1kN9W22eUZ/OYHzcG+jVw27lRqL+BXZKe6o2AMVT2vFeY70rHg7gRblkvJtJMIVIdGRnWLC/PfB5N/I3VVUgUMFQBeSnZcUHB+F8rfKW16O5V4dz4WORdfkyLVDGByYL9ey0jSwMESST1dxfKshtgUnfDnfOzuGbq/5Ep7uIW8jC/wcJHOR6+Z0l8yO24k1tMLNAoiDkklD+jGOeDyer1PORSsROPmsc/oMmVXF2L5v1OAPUCqZgF29PLEPlBX6uAHvhgJ3w6uQgfDZzipHVAq7qwf/7fOQhuUGN0pyz1IyAHxbNBPsj8xK8QtGZJ7N0GUbQfWWBCXhJusc+MIkC6YjGLn+hMLIOmnfXwyNS1jB//jEPbQc1QyXyQxr02PMZ8dYIKggrebvyJeBfCA1qEYAqOw2IXsui8VQ5+mvtMAyfAE809bB5mxQCPa7Vewi3oFoogk5ES0iz2D2PH67nFz3pOWsjk4BY4aL0zlcfbrOfW/WYvloMyylHbUj6D07ih3mjP27NaoUqE3fE05i
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(966005)(508600001)(36756003)(31686004)(30864003)(31696002)(38100700002)(83380400001)(5660300002)(316002)(6512007)(6506007)(6486002)(186003)(86362001)(2616005)(66946007)(8676002)(53546011)(8936002)(2906002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VklvN0p5TE56L0ZsYWZ5ZGxCV2N2VERjSDI1dXljN25GMk94V1dXVS9sRkRx?=
 =?utf-8?B?UVBPTXRRdTRvWHJXUCt1RXczYkJhOGtpQkVtZDFUeTJsM1RuNlBzc2hrUzZ0?=
 =?utf-8?B?UVVIa1pNaFIzbDhJdTE3ZEgvQjU1TUNjMUF4N1BrYVFmNXBRaHZoTWx3Tlpw?=
 =?utf-8?B?Y21jNmhTMVhvZ0NjQWtlUkRJRGxFUGFLQzZLWHlsL1FyVWwvL1YzS1VhaUI4?=
 =?utf-8?B?RUNSbzREYkVoTXZxY2JaaGJ4cm9pV2srZ3NKMEFxNEUyNlNkUStwMG1keGNq?=
 =?utf-8?B?NjVlaE5xNm9nTzVYaVRxcnoyK3B2OFN4WWJLUGdGVTliY284dHI1WWFkWGMw?=
 =?utf-8?B?Tm1lSzhsZ3VmVVdhQytsYVlkVGZWbU1teFdJV2hzN2prcittdDdkWnBORDA1?=
 =?utf-8?B?VnRnYjJObEx2a2dLZFV3QVRWTUdPYnR6WGZiaDJCNWtIZnNTV1BsTUdxN3J0?=
 =?utf-8?B?d2NxYWlkVW5qQXNlaFRSRUxFek1yNUVBNWhwY29rWG1FNGx0RTF6c0ZHSHk4?=
 =?utf-8?B?SWh5Wm9VdCtyVWhhMkRIczNBWDhFZHkva0UzbTQxczlVdGFzcjlkbmVjekRM?=
 =?utf-8?B?T1A5T0s5emlXZ1kvd3JHYU1iZ0dURW5vYWNCVE1SS3pnQlJkMFh6Mnd6emow?=
 =?utf-8?B?NlBrVFRSVTFDQ0RJSFdpRmF5VTlFL1B0NWZLMEo3Q3JuM0ZJT3E2QWF0cm5X?=
 =?utf-8?B?cHFBSFB1OXBTN1ZJd2dleThBMXl5KzdBNmd6UUV1QlEzTDZmTlUwaW1keUZX?=
 =?utf-8?B?bDEwT1dlbFNBK081MzJ4NHJ3T1BqWmc1enA4cXY1MUorTW5BNE5XT2lScHhO?=
 =?utf-8?B?eUJKS1V1NUExaW5QTTZkN3JvZ1hXSVBMb3R0WC80TEtWeC9BT0ZQMDlYZkFR?=
 =?utf-8?B?YXpycUYweWhXMlFiak9RNzg3b3Z6aWdka3JHckdkVEdJWkNNd0djMUVKVGRo?=
 =?utf-8?B?bFFmeUdJck1kOW5TSVpjNWlOMGpZM3dvakc0Y0JBMlNUVDVHWE5iRGRRWDhD?=
 =?utf-8?B?eDA5a1RUQnpPTi9lcE9KWWlSNDVPOWZWQmNKZU00TUdmeW9oQzBHVmZKSGJP?=
 =?utf-8?B?TG5CUldLSGFZa3RhOVkwdmJTdklvOG90dW1ic0tKc3RNTDNHV0tHYkRLaVpB?=
 =?utf-8?B?SUpPWDM3K1RIdGZlcmFQSU1WMzRWdGdVQ1grbHRFc0V3WDJsOGlJRzBRbDFX?=
 =?utf-8?B?ck1iZDhsZWFmT1pDUlVpTVFTQlJnc0dPejJ3V0JXT0FSbWphQi93eG8zU2ls?=
 =?utf-8?B?a0p5R1dFRTFFNWpaS3JuY0VQdzVQZDhZMTV1TUZYK0VSWTlyRVp4bDR2Unpu?=
 =?utf-8?B?T1FreFFtWkpiQ2lGMXQ0S2xoZnROY1pTcWp3akFSc2tNNm1ha3puL2RlNXox?=
 =?utf-8?B?ckJPL0JlbW5PekdyUjY5Y3AxT0RzQ1N5MFlXZGZxL0JJUm1mNUtxZCtxVTRz?=
 =?utf-8?B?N0haQ0ptSFFjN25OMGQxQkllR2xpS24rR2N5aHA2RmdyeXYrYmFvVGZpemlz?=
 =?utf-8?B?d3VwVVFVRTg0NlBtL3Bva3lGRFg1UTR0QWJSTXQxZ2ZwaVZTdnFGZjJVNENT?=
 =?utf-8?B?N0ZxcmlOZm92QWlTODdURFFoUzJSRXlmOUhDcDFrUDI4ekxLWFN0QncyTTZX?=
 =?utf-8?B?VG5sYXVicm9tYm5aSXV4ODhFcTdPOHVmQ3E3Y2FrcW5YZSs1ejBRd1VIQVVo?=
 =?utf-8?B?SmtQY2oyL2Rzc1NXT3Z6SDdyd0phWTR2dFpCT2RKMFl4TWV5S3Izc3hKYWxi?=
 =?utf-8?B?VXlRZFpTUVRFQ0RtbWtZeU4wNDhUNzBaNFcrc2dHUXlZVHRVNjNMUWtWWmFn?=
 =?utf-8?B?T0F4OU1leHZMTFM4cjgvcGFZQjZMNm00dlRIZXhUSzdaYzhoUFhkYWkxclRO?=
 =?utf-8?B?d053QnlNd3JmaVlSV1lYVkxFaHhqWkpkTFNvMmJIanhTa1hTMUhHcWVpNDRi?=
 =?utf-8?B?UFJnSjY4WGxFMm9aNEdUTGh6bmx0aG05cGJEMnN1M1R0ZnJpdFRlU09EcVhN?=
 =?utf-8?B?cS9VMVFZeEdjNjRSdnA3aGFnZk5yTkVxcDhVWHgxMDVNaVhsV2N6UnFGV1g2?=
 =?utf-8?B?akZGT1ZqMFFZVGM2a2Rob1FVUEtzS2JScUdHN3d6OVg1UEY4cExoemYzc2RR?=
 =?utf-8?B?RDh1YTErUDlvZmttZHl5R3FLdjE4dDVWTkVnUjlwVnZraTFPdkFTVXJkU1Ra?=
 =?utf-8?B?bGpBVFJDaExsYVllc05KaTFLcFh3SVB3S05CMlo2MDhYQ2NEclQ4Ri9xdGR5?=
 =?utf-8?B?UTlnNytXaGVYRWluRnJmMWJiazNteDd1d3FmNkdjV1ZydUFwL1BQWHVBTGhC?=
 =?utf-8?B?V1I4cTcxV3NUc1dhbkF4bmF2bzcrOHVDRHRrdWVZWVM5YVdTZWJlRlBFUDg2?=
 =?utf-8?Q?y2TnEIhrAFXBczqA=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ebf7a44-ddb5-4445-c4ac-08d9d5d5e431
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:14:48.4258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nS3V18ORmTtkOhIbejp0Rd7JC5Tzc9SEA53XlT8lcQtXd09boj4+T77m8M4nA7vhGRpsAUkSGRGQL03U+ffPuQq3sBWj7FT+amQXRm1VmXV6Tpxo17eUjFoUGk0HQctj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5965
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 14:14:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2392

Hi Michael,

On 1/11/22 17:59, Michael Opdenacker wrote:
> Replace
> ":ref:`classname.bbclass <ref-classes-classname>`" section
> by
> ":ref:`ref-classes-classname`" section
> because each section has "classname.bbclass" as title,
> therefore the result is the same.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Looks good :)

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks,
Quentin

> ---
>   .../migration-guides/migration-1.3.rst        |  2 +-
>   .../migration-guides/migration-1.5.rst        |  9 ++----
>   .../migration-guides/migration-1.6.rst        |  3 +-
>   documentation/ref-manual/qa-checks.rst        |  4 +--
>   documentation/ref-manual/tasks.rst            |  2 +-
>   documentation/ref-manual/variables.rst        | 29 +++++++++----------
>   6 files changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
> index afb868e7cb..9a1539172e 100644
> --- a/documentation/migration-guides/migration-1.3.rst
> +++ b/documentation/migration-guides/migration-1.3.rst
> @@ -113,7 +113,7 @@ recipes to ``packagegroup-*``, and change them to inherit
>   to remove anything now handled by ``packagegroup.bbclass``, such as
>   providing ``-dev`` and ``-dbg`` packages, setting
>   :term:`LIC_FILES_CHKSUM`, and so forth. See the
> -":ref:`packagegroup.bbclass <ref-classes-packagegroup>`" section for
> +:ref:`ref-classes-packagegroup` section for
>   further details.
>   
>   .. _migration-1.3-image-features:
> diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
> index 15b0b43092..0306b99c65 100644
> --- a/documentation/migration-guides/migration-1.5.rst
> +++ b/documentation/migration-guides/migration-1.5.rst
> @@ -87,8 +87,7 @@ The following changes have been made to the package QA checks:
>      item not mentioned in :term:`ERROR_QA` or :term:`WARN_QA` would be treated as
>      a warning. Consequently, several important items were not already in
>      the default value of :term:`WARN_QA`. All of the possible QA checks are
> -   now documented in the ":ref:`insane.bbclass <ref-classes-insane>`"
> -   section.
> +   now documented in the ":ref:`ref-classes-insane`" section.
>   
>   -  An additional QA check has been added to check if
>      ``/usr/share/info/dir`` is being installed. Your recipe should delete
> @@ -102,8 +101,7 @@ The following changes have been made to the package QA checks:
>      and still wish to have this check performed, you should add
>      "version-going-backwards" to your value for one or the other
>      variables depending on how you wish it to be handled. See the
> -   documented QA checks in the
> -   ":ref:`insane.bbclass <ref-classes-insane>`" section.
> +   documented QA checks in the ":ref:`ref-classes-insane`" section.
>   
>   .. _migration-1.5-directory-layout-changes:
>   
> @@ -222,8 +220,7 @@ recipes that previously inherited from this class, you should rename
>   them from ``task-*`` to ``packagegroup-*`` and inherit packagegroup
>   instead.
>   
> -For more information, see the
> -":ref:`packagegroup.bbclass <ref-classes-packagegroup>`" section.
> +For more information, see the ":ref:`ref-classes-packagegroup`" section.
>   
>   .. _migration-1.5-busybox:
>   
> diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
> index e240038a7b..358086560b 100644
> --- a/documentation/migration-guides/migration-1.6.rst
> +++ b/documentation/migration-guides/migration-1.6.rst
> @@ -222,8 +222,7 @@ Package Tests (ptest) are built but not installed by default. For
>   information on using Package Tests, see the
>   ":ref:`dev-manual/common-tasks:testing packages with ptest`"
>   section in the Yocto Project Development Tasks Manual. For information on the
> -``ptest`` class, see the ":ref:`ptest.bbclass <ref-classes-ptest>`"
> -section.
> +``ptest`` class, see the ":ref:`ref-classes-ptest`" section.
>   
>   .. _migration-1.6-build-changes:
>   
> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
> index 792c099d0c..3364311219 100644
> --- a/documentation/ref-manual/qa-checks.rst
> +++ b/documentation/ref-manual/qa-checks.rst
> @@ -28,7 +28,7 @@ error form along with an explanation.
>   .. note::
>   
>      -  At the end of each message, the name of the associated QA test (as
> -      listed in the ":ref:`insane.bbclass <ref-classes-insane>`"
> +      listed in the ":ref:`ref-classes-insane`"
>         section) appears within square brackets.
>   
>      -  As mentioned, this list of error and warning messages is for QA
> @@ -749,7 +749,7 @@ either raise a warning or an error message, using the
>   variables, respectively. You can also disable checks within a particular
>   recipe using :term:`INSANE_SKIP`. For information on
>   how to work with the QA checks, see the
> -":ref:`insane.bbclass <ref-classes-insane>`" section.
> +":ref:`ref-classes-insane`" section.
>   
>   .. note::
>   
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> index d484d08f82..b51462b79a 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -415,7 +415,7 @@ dependencies specified by :term:`DEPENDS`). See the
>   
>   Removes work files after the OpenEmbedded build system has finished with
>   them. You can learn more by looking at the
> -":ref:`rm_work.bbclass <ref-classes-rm-work>`" section.
> +":ref:`ref-classes-rm-work`" section.
>   
>   .. _ref-tasks-unpack:
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index be496161bd..76831003d1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -56,7 +56,7 @@ system and gives an overview of their function and contents.
>            ALTERNATIVE:busybox = "sh sed test bracket"
>   
>         For more information on the alternatives system, see the
> -      ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
> +      ":ref:`ref-classes-update-alternatives`"
>         section.
>   
>      :term:`ALTERNATIVE_LINK_NAME`
> @@ -76,7 +76,7 @@ system and gives an overview of their function and contents.
>            If :term:`ALTERNATIVE_LINK_NAME` is not defined, it defaults to ``${bindir}/name``.
>   
>         For more information on the alternatives system, see the
> -      ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
> +      ":ref:`ref-classes-update-alternatives`"
>         section.
>   
>      :term:`ALTERNATIVE_PRIORITY`
> @@ -92,7 +92,7 @@ system and gives an overview of their function and contents.
>            ALTERNATIVE_PRIORITY_pkg[name] = "priority"
>   
>         For more information on the alternatives system, see the
> -      ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
> +      ":ref:`ref-classes-update-alternatives`"
>         section.
>   
>      :term:`ALTERNATIVE_TARGET`
> @@ -122,8 +122,7 @@ system and gives an overview of their function and contents.
>            task while retaining support for the command if necessary.
>   
>         For more information on the alternatives system, see the
> -      ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
> -      section.
> +      ":ref:`ref-classes-update-alternatives`" section.
>   
>      :term:`ANY_OF_DISTRO_FEATURES`
>         When inheriting the
> @@ -803,7 +802,7 @@ system and gives an overview of their function and contents.
>         ``meta/classes/binconfig.bbclass`` in the :term:`Source Directory`.
>         You can also find general
>         information on the class in the
> -      ":ref:`binconfig.bbclass <ref-classes-binconfig>`" section.
> +      ":ref:`ref-classes-binconfig`" section.
>   
>      :term:`BP`
>         The base recipe name and version but without any special recipe name
> @@ -2079,7 +2078,7 @@ system and gives an overview of their function and contents.
>         errors by the OpenEmbedded build system. You set this variable in
>         your distribution configuration file. For a list of the checks you
>         can control with this variable, see the
> -      ":ref:`insane.bbclass <ref-classes-insane>`" section.
> +      ":ref:`ref-classes-insane`" section.
>   
>      :term:`EXCLUDE_FROM_SHLIBS`
>         Triggers the OpenEmbedded build system's shared libraries resolver to
> @@ -2158,7 +2157,7 @@ system and gives an overview of their function and contents.
>         system uses to locate unpacked recipe source code.
>   
>         For more information on ``externalsrc.bbclass``, see the
> -      ":ref:`externalsrc.bbclass <ref-classes-externalsrc>`" section. You
> +      ":ref:`ref-classes-externalsrc`" section. You
>         can also find information on how to use this variable in the
>         ":ref:`dev-manual/common-tasks:building software from an external source`"
>         section in the Yocto Project Development Tasks Manual.
> @@ -2172,7 +2171,7 @@ system and gives an overview of their function and contents.
>         Directory.
>   
>         For more information on ``externalsrc.bbclass``, see the
> -      ":ref:`externalsrc.bbclass <ref-classes-externalsrc>`" section. You
> +      ":ref:`ref-classes-externalsrc`" section. You
>         can also find information on how to use this variable in the
>         ":ref:`dev-manual/common-tasks:building software from an external source`"
>         section in the Yocto Project Development Tasks Manual.
> @@ -2843,7 +2842,7 @@ system and gives an overview of their function and contents.
>      :term:`ICECC_DISABLED`
>         Disables or enables the ``icecc`` (Icecream) function. For more
>         information on this function and best practices for using this
> -      variable, see the ":ref:`icecc.bbclass <ref-classes-icecc>`"
> +      variable, see the ":ref:`ref-classes-icecc`"
>         section.
>   
>         Setting this variable to "1" in your ``local.conf`` disables the
> @@ -3740,7 +3739,7 @@ system and gives an overview of their function and contents.
>   
>            INSANE_SKIP:${PN} += "dev-so"
>   
> -      See the ":ref:`insane.bbclass <ref-classes-insane>`" section for a
> +      See the ":ref:`ref-classes-insane`" section for a
>         list of the valid QA checks you can specify using this variable.
>   
>      :term:`INSTALL_TIMEZONE_FILE`
> @@ -5090,7 +5089,7 @@ system and gives an overview of their function and contents.
>   
>         For information on packaging and build performance effects as a
>         result of the package manager in use, see the
> -      ":ref:`package.bbclass <ref-classes-package>`" section.
> +      ":ref:`ref-classes-package`" section.
>   
>      :term:`PACKAGE_DEBUG_SPLIT_STYLE`
>         Determines how to split up and package debug and source information
> @@ -6204,7 +6203,7 @@ system and gives an overview of their function and contents.
>      :term:`RM_WORK_EXCLUDE`
>         With ``rm_work`` enabled, this variable specifies a list of recipes
>         whose work directories should not be removed. See the
> -      ":ref:`rm_work.bbclass <ref-classes-rm-work>`" section for more
> +      ":ref:`ref-classes-rm-work`" section for more
>         details.
>   
>      :term:`ROOT_HOME`
> @@ -8016,7 +8015,7 @@ system and gives an overview of their function and contents.
>         on enabling, running, and writing these tests, see the
>         ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
>         section in the Yocto Project Development Tasks Manual and the
> -      ":ref:`testimage*.bbclass <ref-classes-testimage*>`" section.
> +      ":ref:`ref-classes-testimage*`" section.
>   
>      :term:`THISDIR`
>         The directory in which the file BitBake is currently parsing is
> @@ -8675,7 +8674,7 @@ system and gives an overview of their function and contents.
>         warnings by the OpenEmbedded build system. You set this variable in
>         your distribution configuration file. For a list of the checks you
>         can control with this variable, see the
> -      ":ref:`insane.bbclass <ref-classes-insane>`" section.
> +      ":ref:`ref-classes-insane`" section.
>   
>      :term:`WKS_FILE`
>         Specifies the location of the Wic kickstart file that is used by the
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2379): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2379&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=nVp88lBqBekaH3TrUXZ5jsAn6eFG1CABiI8kXi2wnAmJDqy-jLGlG7nHUFiiYlfe&s=jtgKWnFaRRlegWHBRwMqzA-HyCc26Tk9xZZTztv65Hs&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_88353473_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=nVp88lBqBekaH3TrUXZ5jsAn6eFG1CABiI8kXi2wnAmJDqy-jLGlG7nHUFiiYlfe&s=edhDgRQdgM78oCKg2xzvEGuSDbRg1HkEf0mkutCRNbY&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=nVp88lBqBekaH3TrUXZ5jsAn6eFG1CABiI8kXi2wnAmJDqy-jLGlG7nHUFiiYlfe&s=aDRy3hJtfr6gDsDKACnmdowcut4IOpKOfUO1X9diRSc&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

