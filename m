Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DDEC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 11:26:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web09.83342.1657020376031510352
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 04:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Gll0NuRs;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.41,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFe9Eiyxa/4hDYnTtja3ITeKQsTLfbrboUeNZy+/VNV/c6MsqZjKO/ZhomKSPMDucznCBhVmMDlr+lUffupADu/0qnh1wOVZ1Vt5pEcQ7dyRo841UXhZYBrdOfHUqWy29a+gz+/vUDLGifbUonde4fWShqK2kCmJd9ulhYKNePE9lC0mxZkgKMJojJIrCXC/d1ri1LHSzd8UD82ac5BLNur32ni4gGOcc837p16/HcSCBE0UPtEzP/hPet81u+jXuzzk0rmuhFS7RZCGvol2GMqU4w7DTfAbzlS+DJfNhpL81LertAQyR5AjsQ6O3kvEsuhwrO9OqR8FzeSw9TyuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf1GS0Xq4xNBLgspV3WpbGa1EYFQKN+zkdEvqxDskdg=;
 b=QBxJq7MmEO2j+CaftD0m6vd9HNdmZ6zNPfN/sFu4E+cxI+RwFgNQttEpIerhd1e7mYAWQT9Lk0jxiGfS2nY5VhgcEHm/KwlVgDoRHG+pL6KpbjanImpeHhZi2598y5a2rZlPEcQUZHgZbBr9hHPAlvti9Ww53O3gXvcviPpsnsBZ7JFr1DitrPyI+rLmNkXEqgw/2sYCcgNlOwJHq0o1QJnbRDh/3jKc0JUFK/owO31FlKPfrEmkoonZn+CMgNrtiZsygxtqBHDLQ0CbuODj73G+UW+Q5J+xMOAK6FDWc2Zk+aznZlIfmLsskfPAqNCa35MAptaI34nq1ER17Bp3Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf1GS0Xq4xNBLgspV3WpbGa1EYFQKN+zkdEvqxDskdg=;
 b=Gll0NuRsoKLCjVSJtHhu9iSiL1sCaZ/rtsP6J8CiAZyt4VPEF8ZpUlURPTGc3hSrhIwAm/1S0mCHI0Pz/6V94UHlSYvAGLbMIO20wN8wihaV5vxB/LhJgbF2lUirjPso5aiwhfDQrRsXxqVB5LTruxpOeZoh1yngbJv0BNXToY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB4254.eurprd04.prod.outlook.com (2603:10a6:803:4c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 11:26:11 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::cc58:11a8:839f:895f%7]) with mapi id 15.20.5395.017; Tue, 5 Jul 2022
 11:26:11 +0000
Message-ID: <f6c9cdab-0c17-264d-2b97-e0f7e068ca56@theobroma-systems.com>
Date: Tue, 5 Jul 2022 13:26:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] dev-manual: fix references to BitBake user manual
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20220610171701.7654-1-michael.opdenacker@bootlin.com>
 <740c5857-39f4-0dec-d5d7-f1609849d951@theobroma-systems.com>
 <ab914c8d-00b0-795c-8394-00d57a091c99@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <ab914c8d-00b0-795c-8394-00d57a091c99@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 144af2a0-a45b-4f25-00e7-08da5e7929f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4254:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DFZCofOGOn5SV4AXFmzyMdpZiMFJOHd/K7C9r9lSBcrR4K9PKnUqK1iLe3ApiPp6upXBy/nITqjkkw4uMs46zfzR6DCcP1ETGqca68XGg/NPM4knggj0iYxT5lWV39u7Va+YVmj8zxHx23AsvBxPeZ3UT317k3UMyYY87SSVXZsDLfsuaGsRK+Otw5f0w4krleWeCz1HMeODCMvNweDZkeDb1YVjMSWr5DQh/d/i0If1TYlwKn4zbaGsA9MSWr9lluWJi60NlEz+PeDQiE3Vf9iicOxezWIeLPmkxxspWZ2+Ca6radynXxau4YedKiSdwz87fI4ATmHLm4KFb0mnso+zj5fVUzjnwa5/xKAuMtHGJ15FDeOyzggD8DeebapjMSlxGaL78OHvFz26vu9yIGD24UKZ4PJzzJVTzb3DPAXQgcATHkqVG7fVm+l7WJ6x2ciainuI/r7t1YbuZ7ua7fCvlQr6orG8HY1Q0SdzHRSB4W+FOFmYQrnyUOseHXiprrAZKghWzIzYTUVF2qOBM8niuUiZ6nkShrThwT5sW4dQZCaOCJ810pffJmCZVn8ELMCoDzL7viih3UJWLvT8Y+lOCE5RjdUfIkt7c2/dSFsfQjcpdOrlEzWM2LkL6Pw8XDyQlKjdBr8m6uO7GZmiD1PuVihaltN2HZVSmqZ4RP7fhOKiNPtfNoCxAAISZ4/V2rBZRN2Wqc9Pzy10xH9LRP4R+105uAEpT00NLwD5YL3NA5ZD3cv3J1/8glO0MLgw5DxyD0e5N+Bz+lpKgBIz1NA+1HSpGRR3uGuY6SXjunyxBwgTLZBmAg3sw8KaotT3t29U5sCbF45+YmtatpF52202IvFlJ4BPkWNVvIW/YSd4pyZwtaMsT7PzCzygkG7s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(376002)(346002)(39840400004)(26005)(6512007)(66946007)(83380400001)(41300700001)(2906002)(8676002)(44832011)(66476007)(66556008)(5660300002)(6486002)(966005)(8936002)(2616005)(478600001)(186003)(53546011)(31696002)(36756003)(6506007)(31686004)(316002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VBEEsyQ9W71GkDXwg3qqFW3QQBXI1vXEg+pvevkGxQTrPl0q7CWTN2PuIhPM?=
 =?us-ascii?Q?yY7e+NtwItAgvInuIH5T10qDFx6Rtl0M0hgC4sfLHRkNnk8LB0y5UNxXt7Ny?=
 =?us-ascii?Q?49RUSCg/B2/lnMjI/Wyr8vako6/MBBLtF1zrccnmFEdf9+Bzsof1MnNXjHLK?=
 =?us-ascii?Q?O5HqvaEj4Cbq7phjD5GqcyTimkWgfJNlPWqw62VF/68Csw8zC9AupOaJ/eF9?=
 =?us-ascii?Q?+kKOsk2+gaGHHTAe8WJAt6VtmL9nN3JGVep5gkE2JV+Cvg1MVLuGcaSCRRE3?=
 =?us-ascii?Q?d2do/MfDBcZI/zWCwINpgyiJ+F9rB0aDfT1tli/QhqlcrKp1Yz7pdeF7qkyw?=
 =?us-ascii?Q?SIEMbS2DVxM4THgbJzDGNZuCnAdDWEbasqiBgcTipJuitEzTC3wdNeR67ven?=
 =?us-ascii?Q?ZG59c71wqlWMT935kN26NTRMU7ERBk3zy+P4Q/cEDybmscPDyur4k+ElXkaH?=
 =?us-ascii?Q?pahaFXJ9gYIRU5Jg9Iv5Y9tqTpQYNjfc+PJ0d2DnS+BLh1W9bXZi1Gdn+VJu?=
 =?us-ascii?Q?WpNP6nlJ0zeFw6GYDE7XOLy66BTYtis/QZz/d11a11CGI328zRTf5PNjmd5l?=
 =?us-ascii?Q?lStN7MyYNmhfuvpEwQFHfV4w3u5Hsnzzl5Yfvce0uJ51Wuzs6Cg9MqUwadML?=
 =?us-ascii?Q?JhhtCvk67ttBEKxQF2qMbUew4uJnqR2wnIir2K8r7NcezKwZQmNfNs0285Hf?=
 =?us-ascii?Q?i9fcSk8eFobWYTq8fTgJx9/EijTBn0fG/fu9n+BAwF91n70mmKMK0V/TUkMf?=
 =?us-ascii?Q?/ADYMJmqZFSXmarCwD1YdUG4jQNkYJiBEC0C/w8OAv8PmvJ0WdhS8bybdfCW?=
 =?us-ascii?Q?vhgDpCqXuHiqbcB96T5YexdbGSepS4L8lJguzEqP+DmxwJJ6kU0HSL36uR8n?=
 =?us-ascii?Q?UoFhcyMBzDHxmSnl5cIMYbFIhnxKBM40z9ufZko3RwfJRi1N0QKJovOpyEbV?=
 =?us-ascii?Q?fZ4nye3ul+8lQpfhl8d4/+TzdPokPS5Fi1W5gyJ+lboSm5Xqh1dj9Sfd0Ves?=
 =?us-ascii?Q?LwCY0n4sf0HnJZvuMgChfSQVWo43DxzeHsEiKlQcpMoywBA0FuYtXKfy/1UA?=
 =?us-ascii?Q?KckBglAyzt6T2TbU9DViw/IniHloz6REJW7kk7xWop2vH+P7ah1BYsCzBAmM?=
 =?us-ascii?Q?YRB8YALtzIRvzigAfKibt4PGgCqr+Hq16IUWEqOFJrmZcALCUwU+pI4JWdZX?=
 =?us-ascii?Q?DHFVFgRUYJC7uVjoIcjWzlQmfmYCdVJm+vtg6yPfc1zErG5nfbAk+0S1Ke1k?=
 =?us-ascii?Q?4sOUAY6ZLVvW+bxC5LRSxwXdhIJw0woBPqQGapYwKApzy3d8O+jc8AbRDKcA?=
 =?us-ascii?Q?G9l6+Q4dCpH8SbGjjjYf5WyTAWW0CDqV7PY89IYL6YXIp9hUT2Cb9fQlYnnR?=
 =?us-ascii?Q?1cOHsUHVBTecbNie3d23bDgEiefIEVHafyLiS03d742X9tSpBtYfpXAoMy+J?=
 =?us-ascii?Q?C5XYwRCeCq/OpHK61wOoc6102gZ+q+j0dqYZG6jehVyVVuF8sykGrWY260uF?=
 =?us-ascii?Q?x+yXYXVjeaDBQo3yswLfSwrRj18ueaoUYHYfw2XQ9d9W6zCG8WxmGSz77zx/?=
 =?us-ascii?Q?0qCDqXWYMW2XRF2SUoYBYfunEa+/4bqACatKl2OpTvfgmzeTc9xXCip3CmCe?=
 =?us-ascii?Q?X9U1S37Ai0OrdSANFxWMMkg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 144af2a0-a45b-4f25-00e7-08da5e7929f1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 11:26:11.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m8g7x+jlJg8kk+GbDOPxwhXVuBN+s/0oecRZwsFa+IM/2iaL4Q+2NHWdJtZBdS7RYdo96RikfGIh188UfLv+g1ENEnVT+8DgeeHROHiIZCr0J4AvdaFATtAR3udgnp1U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4254
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Jul 2022 11:26:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3051

Hi Michael,

On 6/13/22 10:56, Michael Opdenacker wrote:
> Hi Quentin
>=20
> On 6/13/22 10:19, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On 6/10/22 19:17, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Fix a wrong reference
>>> Add missing double quotes in a reference to a chapter title
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>> =C2=A0 documentation/dev-manual/common-tasks.rst | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/documentation/dev-manual/common-tasks.rst=20
>>> b/documentation/dev-manual/common-tasks.rst
>>> index ca6d594386..7b9fdac10c 100644
>>> --- a/documentation/dev-manual/common-tasks.rst
>>> +++ b/documentation/dev-manual/common-tasks.rst
>>> @@ -2563,7 +2563,7 @@ Recipe Syntax
>>> =C2=A0 Understanding recipe file syntax is important for writing recipe=
s. The
>>> =C2=A0 following list overviews the basic items that make up a BitBake =
recipe
>>> =C2=A0 file. For more complete BitBake syntax descriptions, see the
>>> -":doc:`bitbake-user-manual/bitbake-user-manual-metadata`"
>>> +":doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`"
>>
>> I don't understand why this is required? Sphinx should find this link=20
>> just fine in the objects.inv from the Bitbake docs if I remember=20
>> correctly? Is this just to have the same "convention" (since we=20
>> already have links using bitbake: in front) or is this actually fixing=20
>> a bug somehow?
>>
>> If the link was broken, we need to work on running checklinks when=20
>> building the docs so we're aware when links are broken or outdated.=20
>> Well, it's anyways a good idea :)
>=20
>=20
> Thanks for the review. I should have given details. Actually, that link=20
> was missing "bitbake:" at the beginning. I don't know how it worked=20
> before switching to Sphinx 5.0.1, but at least it wasn't compliant with=20
> our guidelines (in the documentation/README file) to add a "bitbake:"=20
> prefix to references to the BitBake user manual.
>=20

FYI, the :doc: directive does not look into intersphinx references=20
anymore since 5.0.0, c.f.=20
https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html#conf=
val-intersphinx_disabled_reftypes.=20
This behavior can be changed and reverted to pre-5.0 behavior with the=20
intersphinx_disabled_reftypes variable set in conf.py.

As opposed to :term: which I feel like benefits from the ability to=20
fallback to bitbake intersphinx term definition if not defined in=20
yocto-docs, I am not so sure about going back to pre-5.0 behavior for=20
the :doc: directive. It seems likely we can have collisions in names and=20
I think it's not desired?

Cheers,
Quentin

