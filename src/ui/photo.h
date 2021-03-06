#ifndef _PHOTO_H
#define _PHOTO_H

#include "GenericCardContainerUI.h"
#include "QSanSelectableItem.h"
#include "carditem.h"
#include "player.h"
#include "protocol.h"
#include "sprite.h"

#include <QComboBox>
#include <QGraphicsObject>
#include <QPixmap>

class ClientPlayer;
class RoleComboBox;
class QPushButton;

class QPropertyAnimation;

class Photo : public PlayerCardContainer
{
    Q_OBJECT

public:
    explicit Photo();
    const ClientPlayer *getPlayer() const;
    void speak(const QString &content);
    virtual void repaintAll();
    QList<CardItem *> removeCardItems(const QList<int> &card_id, Player::Place place);

    void setEmotion(const QString &emotion, bool permanent = false);
    void tremble();
    //void showSkillName(const QString &skill_name,bool isSelf);

    enum FrameType
    {
        S_FRAME_PLAYING,
        S_FRAME_RESPONDING,
        S_FRAME_SOS,
        S_FRAME_NO_FRAME
    };

    void setFrame(FrameType type);
    virtual QRectF boundingRect() const;
    QGraphicsItem *getMouseClickReceiver();

public slots:
    void updatePhase();
    void hideEmotion();
    //void hideSkillName();
    virtual void updateDuanchang();
    virtual void refresh();

protected:
    inline virtual QGraphicsItem *_getEquipParent()
    {
        return _m_groupMain;
    }
    inline virtual QGraphicsItem *_getDelayedTrickParent()
    {
        return _m_groupMain;
    }
    inline virtual QGraphicsItem *_getAvatarParent()
    {
        return _m_groupMain;
    }
    inline virtual QGraphicsItem *_getMarkParent()
    {
        return _m_floatingArea;
    }
    inline virtual QGraphicsItem *_getPhaseParent()
    {
        return _m_groupMain;
    }
    inline virtual QGraphicsItem *_getRoleComboBoxParent()
    {
        return _m_groupMain;
    }
    inline virtual QGraphicsItem *_getProgressBarParent()
    {
        return this;
    }
    inline virtual QGraphicsItem *_getFocusFrameParent()
    {
        return _m_groupMain;
    }
    inline virtual QGraphicsItem *_getDeathIconParent()
    {
        return _m_groupDeath;
    }
    virtual QGraphicsItem *_getPileParent()
    {
        return _m_groupMain;
    }
    inline virtual QString getResourceKeyName()
    {
        return QSanRoomSkin::S_SKIN_KEY_PHOTO;
    }
    inline virtual QAbstractAnimation *_getPlayerRemovedEffect()
    {
        return _blurEffect;
    }

    virtual QPointF getHeroSkinContainerPosition() const;

    //virtual const QSanShadowTextFont &getSkillNameFont() const {
    //    return G_PHOTO_LAYOUT.m_skillNameFont;
    //}
    //virtual const QRect &getSkillNameArea() const { return G_PHOTO_LAYOUT.m_skillNameArea; }

    virtual void _adjustComponentZValues(bool killed = false);
    bool _addCardItems(QList<CardItem *> &card_items, const CardsMoveStruct &moveInfo);

    virtual void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    QPropertyAnimation *initializeBlurEffect(GraphicsPixmapHoverItem *icon);
    virtual void _initializeRemovedEffect();

    FrameType _m_frameType;
    QGraphicsPixmapItem *_m_mainFrame;
    Sprite *emotion_item;
    //QGraphicsPixmapItem *_m_skillNameItem;
    QGraphicsPixmapItem *_m_focusFrame;
    QGraphicsPixmapItem *_m_onlineStatusItem;
    QGraphicsRectItem *_m_duanchangMask;
    QParallelAnimationGroup *_blurEffect;
};

#endif
